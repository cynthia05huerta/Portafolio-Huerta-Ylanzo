package com.portafolio.controller;

import com.portafolio.dao.SemanaDAO;
import com.portafolio.model.Semana;
import com.portafolio.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/estudiante/semana/editar")
public class EditarSemanaEstudianteController
        extends HttpServlet {

    private final SemanaDAO semanaDAO =
            new SemanaDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        Usuario estudiante =
                (Usuario) request.getSession()
                        .getAttribute("usuarioLogueado");

        if (estudiante == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return;
        }

        if (!estudiante.isEstudiante()) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Acceso exclusivo para estudiantes."
            );

            return;
        }

        try {

            int id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            Semana semana =
                    semanaDAO.buscarPorId(id);

            if (semana == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Semana no encontrada."
                );

                return;
            }

            request.setAttribute(
                    "semana",
                    semana
            );

            request.getRequestDispatcher(
                    "/views/estudiante/editar-semana.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "ID de semana inválido."
            );
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        Usuario estudiante =
                (Usuario) request.getSession()
                        .getAttribute("usuarioLogueado");

        if (estudiante == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return;
        }

        if (!estudiante.isEstudiante()) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN
            );

            return;
        }

        try {

            int id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            int numero =
                    Integer.parseInt(
                            request.getParameter("numero")
                    );

            String titulo =
                    request.getParameter("titulo");

            String descripcion =
                    request.getParameter("descripcion");

            if (
                    titulo == null ||
                            titulo.isBlank()
            ) {

                request.getSession()
                        .setAttribute(
                                "flashError",
                                "El título de la semana es obligatorio."
                        );

                response.sendRedirect(
                        request.getContextPath()
                                + "/estudiante/semana/editar?id="
                                + id
                );

                return;
            }

            Semana semana =
                    new Semana();

            semana.setId(id);
            semana.setNumero(numero);
            semana.setTitulo(titulo.trim());

            semana.setDescripcion(
                    descripcion == null
                            ? ""
                            : descripcion.trim()
            );

            boolean actualizado =
                    semanaDAO.actualizar(semana);

            if (actualizado) {

                request.getSession()
                        .setAttribute(
                                "flash",
                                "Semana actualizada correctamente."
                        );

            } else {

                request.getSession()
                        .setAttribute(
                                "flashError",
                                "No se pudo actualizar la semana."
                        );
            }

            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/semanas"
            );

        } catch (NumberFormatException e) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Los datos ingresados no son válidos."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/semanas"
            );
        }
    }
}