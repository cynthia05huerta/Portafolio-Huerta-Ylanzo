package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.TrabajoDAO;

import com.portafolio.model.Archivo;
import com.portafolio.model.Trabajo;
import com.portafolio.model.Usuario;

import com.portafolio.util.ArchivoStorage;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.nio.file.Files;
import java.nio.file.Path;


@WebServlet("/estudiante/archivo/eliminar")
public class EliminarArchivoEstudianteController
        extends HttpServlet {


    private final ArchivoDAO archivoDAO =
            new ArchivoDAO();

    private final TrabajoDAO trabajoDAO =
            new TrabajoDAO();


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {


        /*
         * ==========================================
         * VERIFICAR SESIÓN
         * ==========================================
         */

        Usuario usuario =
                (Usuario) request
                        .getSession()
                        .getAttribute(
                                "usuarioLogueado"
                        );


        if (usuario == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }


        /*
         * ==========================================
         * OBTENER ID DEL ARCHIVO
         * ==========================================
         */

        String parametroArchivo =
                request.getParameter(
                        "archivoId"
                );


        if (
                parametroArchivo == null ||
                        parametroArchivo.isBlank()
        ) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "No se recibió el ID del archivo."
            );

            return;
        }


        int archivoId;


        try {

            archivoId =
                    Integer.parseInt(
                            parametroArchivo
                    );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "El ID del archivo no es válido."
            );

            return;
        }


        /*
         * ==========================================
         * BUSCAR ARCHIVO
         * ==========================================
         */

        Archivo archivo =
                archivoDAO.buscarPorId(
                        archivoId
                );


        if (archivo == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Archivo no encontrado."
            );

            return;
        }


        /*
         * ==========================================
         * BUSCAR TRABAJO
         * ==========================================
         */

        Trabajo trabajo =
                trabajoDAO.buscarPorId(
                        archivo.getTrabajoId()
                );


        if (trabajo == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Trabajo no encontrado."
            );

            return;
        }


        /*
         * ==========================================
         * VERIFICAR QUE SEA DEL ESTUDIANTE
         * ==========================================
         */

        if (
                trabajo.getUsuarioId()
                        != usuario.getId()
        ) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "No tienes permiso para eliminar este archivo."
            );

            return;
        }


        try {

            /*
             * ======================================
             * ELIMINAR ARCHIVO FÍSICO
             * ======================================
             */

            if (
                    archivo.getRutaArchivo() != null &&
                            !archivo.getRutaArchivo().isBlank()
            ) {

                Path ruta =
                        ArchivoStorage.resolver(
                                archivo.getRutaArchivo()
                        );


                Files.deleteIfExists(
                        ruta
                );
            }


            /*
             * ======================================
             * ELIMINAR DE MYSQL
             * ======================================
             */

            archivoDAO.eliminarPorId(
                    archivoId
            );


            /*
             * ======================================
             * MENSAJE
             * ======================================
             */

            request.getSession()
                    .setAttribute(
                            "flash",
                            "Archivo eliminado correctamente."
                    );


        } catch (Exception e) {

            e.printStackTrace();


            request.getSession()
                    .setAttribute(
                            "flashError",
                            "No se pudo eliminar el archivo."
                    );
        }


        /*
         * ==========================================
         * VOLVER A EDITAR LA MISMA ENTREGA
         * ==========================================
         */

        response.sendRedirect(
                request.getContextPath()
                        + "/estudiante/trabajo/editar?id="
                        + trabajo.getId()
        );
    }
}