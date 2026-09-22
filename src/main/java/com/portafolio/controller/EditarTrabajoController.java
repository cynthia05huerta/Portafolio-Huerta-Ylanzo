package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.TrabajoDAO;

import com.portafolio.model.Archivo;
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
import java.util.List;

@WebServlet("/estudiante/trabajo/editar")

@MultipartConfig(
        maxFileSize = 20L * 1024 * 1024,
        maxRequestSize = 22L * 1024 * 1024
)

public class EditarTrabajoController
        extends HttpServlet {

    private final TrabajoDAO trabajoDAO =
            new TrabajoDAO();

    private final ArchivoDAO archivoDAO =
            new ArchivoDAO();


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

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

        try {

            int id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            Trabajo trabajo =
                    trabajoDAO.buscarPorId(id);

            if (trabajo == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Entrega no encontrada."
                );

                return;
            }

            if (
                    trabajo.getUsuarioId()
                            != usuario.getId()
            ) {

                response.sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "No tienes permiso para editar esta entrega."
                );

                return;
            }

            List<Archivo> archivos =
                    archivoDAO.listarPorTrabajo(id);

            trabajo.getArchivos().clear();
            trabajo.getArchivos().addAll(archivos);

            request.setAttribute(
                    "trabajo",
                    trabajo
            );

            request.getRequestDispatcher(
                    "/views/estudiante/editar-trabajo.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "ID de entrega no válido."
            );
        }
    }


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

        if (usuario == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }

        int id;

        try {

            id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "ID de entrega no válido."
            );

            return;
        }

        Trabajo trabajoActual =
                trabajoDAO.buscarPorId(id);

        if (trabajoActual == null) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Entrega no encontrada."
            );

            return;
        }

        if (
                trabajoActual.getUsuarioId()
                        != usuario.getId()
        ) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "No tienes permiso para modificar esta entrega."
            );

            return;
        }

        try {

            String titulo =
                    request.getParameter(
                            "titulo"
                    );

            String descripcion =
                    request.getParameter(
                            "descripcion"
                    );

            String enlaceExterno =
                    request.getParameter(
                            "enlaceExterno"
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
                                + "/estudiante/trabajo/editar?id="
                                + id
                );

                return;
            }

            Trabajo trabajo =
                    new Trabajo();

            trabajo.setId(
                    id
            );

            trabajo.setUsuarioId(
                    usuario.getId()
            );

            trabajo.setTitulo(
                    titulo.trim()
            );

            trabajo.setDescripcion(
                    descripcion == null
                            ? ""
                            : descripcion.trim()
            );

            trabajo.setEnlaceExterno(
                    enlaceExterno == null
                            ? ""
                            : enlaceExterno.trim()
            );

            boolean actualizado =
                    trabajoDAO.actualizar(
                            trabajo
                    );

            if (!actualizado) {

                request.getSession()
                        .setAttribute(
                                "flashError",
                                "No se pudo actualizar la entrega."
                        );

                response.sendRedirect(
                        request.getContextPath()
                                + "/estudiante/trabajo/editar?id="
                                + id
                );

                return;
            }


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
                                trabajoActual.getSemanaId()
                        );

                Archivo archivo =
                        new Archivo();

                archivo.setTrabajoId(
                        id
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
                            "Entrega actualizada correctamente."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/semana?id="
                            + trabajoActual.getSemanaId()
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "No se pudieron guardar los cambios."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/estudiante/trabajo/editar?id="
                            + id
            );
        }
    }
}