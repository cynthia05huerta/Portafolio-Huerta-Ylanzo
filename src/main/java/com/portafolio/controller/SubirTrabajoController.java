package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.SemanaDAO;
import com.portafolio.dao.TrabajoDAO;

import com.portafolio.model.Archivo;
import com.portafolio.model.Semana;
import com.portafolio.model.Trabajo;
import com.portafolio.model.Usuario;

import com.portafolio.util.ArchivoStorage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;


@WebServlet("/estudiante/entrega/guardar")

@MultipartConfig(
        maxFileSize = 20L * 1024 * 1024,
        maxRequestSize = 22L * 1024 * 1024
)

public class SubirTrabajoController
        extends HttpServlet {


    private final SemanaDAO semanaDAO =
            new SemanaDAO();

    private final TrabajoDAO trabajoDAO =
            new TrabajoDAO();

    private final ArchivoDAO archivoDAO =
            new ArchivoDAO();


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {


        Usuario usuario =
                (Usuario) request
                        .getSession()
                        .getAttribute(
                                "usuarioLogueado"
                        );


        if (
                usuario == null ||
                        !usuario.isEstudiante()
        ) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN
            );

            return;
        }


        String parametroSemana =
                request.getParameter(
                        "idSemana"
                );


        if (
                parametroSemana == null ||
                        parametroSemana.isBlank()
        ) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "Debes seleccionar una semana."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/nueva-entrega"
            );

            return;
        }


        int semanaId;


        try {

            semanaId =
                    Integer.parseInt(
                            parametroSemana
                    );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST
            );

            return;
        }


        Semana semana =
                semanaDAO.buscarPorId(
                        semanaId
                );


        if (semana == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND
            );

            return;
        }


        String titulo =
                request.getParameter(
                        "titulo"
                );


        String descripcion =
                request.getParameter(
                        "descripcion"
                );


        String enlace =
                request.getParameter(
                        "enlace"
                );


        if (
                titulo == null ||
                        titulo.isBlank()
        ) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "El título es obligatorio."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/nueva-entrega"
            );

            return;
        }


        try {

            Trabajo trabajo =
                    new Trabajo();


            trabajo.setTitulo(
                    titulo.trim()
            );


            trabajo.setDescripcion(
                    descripcion == null
                            ? ""
                            : descripcion.trim()
            );


            trabajo.setUsuarioId(
                    usuario.getId()
            );


            trabajo.setSemanaId(
                    semanaId
            );


            if (
                    enlace != null &&
                            !enlace.isBlank()
            ) {

                trabajo.setEnlaceExterno(
                        enlace.trim()
                );
            }


            int trabajoId =
                    trabajoDAO.crear(
                            trabajo
                    );


            Part archivoPart =
                    request.getPart(
                            "archivo"
                    );


            if (
                    archivoPart != null &&
                            archivoPart.getSize() > 0
            ) {

                ArchivoStorage.Guardado guardado =
                        ArchivoStorage.guardar(
                                archivoPart,
                                semana.getNumero()
                        );


                Archivo archivo =
                        new Archivo();


                archivo.setTrabajoId(
                        trabajoId
                );


                archivo.setNombreArchivo(
                        guardado.original()
                );


                archivo.setRutaArchivo(
                        guardado.ruta()
                );


                archivoDAO.guardar(
                        archivo
                );
            }


            request.getSession()
                    .setAttribute(
                            "flash",
                            "Entrega publicada correctamente."
                    );


            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/semanas"
            );


        } catch (IllegalArgumentException e) {

            request.getSession()
                    .setAttribute(
                            "flashError",
                            e.getMessage()
                    );


            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/nueva-entrega"
            );


        } catch (Exception e) {

            e.printStackTrace();


            request.getSession()
                    .setAttribute(
                            "flashError",
                            "No se pudo publicar la entrega."
                    );


            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/nueva-entrega"
            );
        }
    }
}