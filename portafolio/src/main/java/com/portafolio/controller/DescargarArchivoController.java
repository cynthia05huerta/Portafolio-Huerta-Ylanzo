package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.model.Archivo;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/archivo/descargar")
public class DescargarArchivoController extends HttpServlet {

    private final ArchivoDAO archivoDAO = new ArchivoDAO();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        try {
            String idParametro = request.getParameter("id");

            if (idParametro == null || idParametro.isBlank()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Falta el identificador del archivo."
                );
                return;
            }

            int archivoId = Integer.parseInt(idParametro);
            Archivo archivo = archivoDAO.buscarPorId(archivoId);

            if (archivo == null || archivo.getRutaArchivo() == null || archivo.getRutaArchivo().isBlank()) {
                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Archivo no encontrado."
                );
                return;
            }

            String urlArchivo = archivo.getRutaArchivo();

            // Si el archivo está en la nube (Cloudinary), redirigimos al navegador
            // para que lo abra en el visor integrado y permita visualizarlo o descargarlo.
            if (urlArchivo.startsWith("http")) {
                response.sendRedirect(urlArchivo);
                return;
            }

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "El archivo no está disponible en la nube."
            );

        } catch (NumberFormatException e) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "El identificador del archivo no es válido."
            );
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "No se pudo acceder al archivo."
            );
        }
    }
}