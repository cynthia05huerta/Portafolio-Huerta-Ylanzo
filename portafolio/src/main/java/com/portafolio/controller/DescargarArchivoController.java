package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.model.Archivo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/archivo/descargar")
public class DescargarArchivoController extends HttpServlet {

    private final ArchivoDAO archivoDAO = new ArchivoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de archivo no proporcionado.");
            return;
        }

        int archivoId;
        try {
            archivoId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de archivo inválido.");
            return;
        }

        Archivo archivo = archivoDAO.buscarPorId(archivoId);
        if (archivo == null || archivo.getRutaArchivo() == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Archivo no encontrado.");
            return;
        }

        String urlArchivo = archivo.getRutaArchivo();

        // Si es una URL de Cloudinary u HTTP, redirigimos directamente para que el navegador lo abra/descargue
        if (urlArchivo.startsWith("http://") || urlArchivo.startsWith("https://")) {
            response.sendRedirect(urlArchivo);
        } else {
            // Compatibilidad por si quedó alguna ruta local antigua
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Formato de ruta de archivo no soportado.");
        }
    }
}