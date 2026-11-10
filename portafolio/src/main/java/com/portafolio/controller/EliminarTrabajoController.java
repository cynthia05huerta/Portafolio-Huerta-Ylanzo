package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.TrabajoDAO;

import com.portafolio.model.Archivo;
import com.portafolio.model.Trabajo;
import com.portafolio.model.Usuario;

import com.portafolio.util.ArchivoStorage;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;


@WebServlet("/estudiante/trabajo/eliminar")
public class EliminarTrabajoController
        extends HttpServlet {


    private final TrabajoDAO trabajoDAO =
            new TrabajoDAO();

    private final ArchivoDAO archivoDAO =
            new ArchivoDAO();


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {


        Usuario usuario =
                (Usuario) request.getSession()
                        .getAttribute("usuarioLogueado");


        if (
                usuario == null ||
                        !usuario.isEstudiante()
        ) {

            response.sendError(403);
            return;
        }


        int trabajoId;

        try {

            trabajoId =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

        } catch (Exception e) {

            response.sendError(400);
            return;
        }


        Trabajo trabajo =
                trabajoDAO.buscarPorId(
                        trabajoId
                );


        if (
                trabajo == null ||
                        trabajo.getUsuarioId()
                                != usuario.getId()
        ) {

            response.sendError(404);
            return;
        }


        int semanaId =
                trabajo.getSemanaId();


        try {

            /*
             * Obtener archivos
             */
            List<Archivo> archivos =
                    archivoDAO.listarPorTrabajo(
                            trabajoId
                    );


            /*
             * Eliminar físicamente
             */
            for (Archivo archivo : archivos) {

                try {

                    Path ruta =
                            ArchivoStorage.resolver(
                                    archivo.getRutaArchivo()
                            );

                    Files.deleteIfExists(ruta);

                } catch (Exception ignored) {
                }
            }


            /*
             * Primero hijos
             */
            archivoDAO.eliminarPorTrabajo(
                    trabajoId
            );


            /*
             * Después trabajo
             */
            trabajoDAO.eliminar(
                    trabajoId,
                    usuario.getId()
            );


            request.getSession()
                    .setAttribute(
                            "flash",
                            "Entrega eliminada correctamente."
                    );


        } catch (Exception e) {

            e.printStackTrace();

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "No se pudo eliminar la entrega."
                    );
        }


        response.sendRedirect(
                request.getContextPath()
                        + "/estudiante/semana?id="
                        + semanaId
        );
    }
}