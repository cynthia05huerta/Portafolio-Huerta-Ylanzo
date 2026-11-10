package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.ComentarioDAO;
import com.portafolio.dao.TrabajoDAO;

import com.portafolio.model.Comentario;
import com.portafolio.model.Trabajo;
import com.portafolio.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/profesor/evaluar")
public class ProfesorEvaluarController
        extends HttpServlet {


    private final TrabajoDAO trabajoDAO =
            new TrabajoDAO();


    private final ArchivoDAO archivoDAO =
            new ArchivoDAO();


    private final ComentarioDAO comentarioDAO =
            new ComentarioDAO();


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {


        Usuario profesor =
                (Usuario) request
                        .getSession()
                        .getAttribute(
                                "usuarioLogueado"
                        );


        if (profesor == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }


        if (!profesor.isProfesor()) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN
            );

            return;
        }


        try {

            int trabajoId =
                    Integer.parseInt(
                            request.getParameter(
                                    "trabajoId"
                            )
                    );


            Trabajo trabajo =
                    trabajoDAO.buscarPorId(
                            trabajoId
                    );


            if (trabajo == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Trabajo no encontrado."
                );

                return;
            }


            trabajo.getArchivos()
                    .clear();


            trabajo.getArchivos()
                    .addAll(

                            archivoDAO
                                    .listarPorTrabajo(
                                            trabajoId
                                    )

                    );


            Comentario evaluacion =
                    comentarioDAO
                            .buscarPorTrabajo(
                                    trabajoId
                            );


            request.setAttribute(
                    "trabajo",
                    trabajo
            );


            request.setAttribute(
                    "evaluacion",
                    evaluacion
            );


            request.getRequestDispatcher(
                    "/views/profesor/evaluar.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "ID de trabajo inválido."
            );
        }
    }


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {


        Usuario profesor =
                (Usuario) request
                        .getSession()
                        .getAttribute(
                                "usuarioLogueado"
                        );


        if (profesor == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }


        if (!profesor.isProfesor()) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN
            );

            return;
        }


        int trabajoId;


        try {

            trabajoId =
                    Integer.parseInt(
                            request.getParameter(
                                    "trabajoId"
                            )
                    );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Trabajo inválido."
            );

            return;
        }


        Trabajo trabajo =
                trabajoDAO.buscarPorId(
                        trabajoId
                );


        if (trabajo == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND
            );

            return;
        }


        try {

            String notaTexto =
                    request.getParameter(
                            "nota"
                    );


            String contenido =
                    request.getParameter(
                            "comentario"
                    );


            if (
                    notaTexto == null ||
                            notaTexto.isBlank()
            ) {

                throw new NumberFormatException();
            }


            double nota =
                    Double.parseDouble(
                            notaTexto
                    );


            if (
                    nota < 0 ||
                            nota > 20
            ) {

                request.getSession()
                        .setAttribute(
                                "flashError",
                                "La nota debe estar entre 0 y 20."
                        );


                response.sendRedirect(
                        request.getContextPath()
                                + "/profesor/evaluar?trabajoId="
                                + trabajoId
                );

                return;
            }


            if (contenido == null) {
                contenido = "";
            }


            Comentario existente =
                    comentarioDAO
                            .buscarPorTrabajo(
                                    trabajoId
                            );


            boolean correcto =
                    comentarioDAO
                            .guardarOActualizar(
                                    trabajoId,
                                    profesor.getId(),
                                    contenido.trim(),
                                    nota
                            );


            if (!correcto) {

                throw new RuntimeException(
                        "No se modificó la evaluación."
                );
            }


            if (existente == null) {

                request.getSession()
                        .setAttribute(
                                "flash",
                                "Evaluación guardada correctamente."
                        );

            } else {

                request.getSession()
                        .setAttribute(
                                "flash",
                                "Evaluación actualizada correctamente."
                        );
            }


            response.sendRedirect(
                    request.getContextPath()
                            + "/profesor/semana?id="
                            + trabajo.getSemanaId()
            );


        } catch (NumberFormatException e) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "La nota ingresada no es válida."
                    );


            response.sendRedirect(
                    request.getContextPath()
                            + "/profesor/evaluar?trabajoId="
                            + trabajoId
            );


        } catch (Exception e) {

            e.printStackTrace();


            request.getSession()
                    .setAttribute(
                            "flashError",
                            "No se pudo guardar la evaluación."
                    );


            response.sendRedirect(
                    request.getContextPath()
                            + "/profesor/evaluar?trabajoId="
                            + trabajoId
            );
        }
    }
}