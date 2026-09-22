package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.model.Archivo;
import com.portafolio.util.ArchivoStorage;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.net.URLEncoder;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;


@WebServlet("/archivo/descargar")
public class DescargarArchivoController extends HttpServlet {

    private final ArchivoDAO archivoDAO =
            new ArchivoDAO();


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        try {

            /*
             * =============================================
             * OBTENER ID DEL ARCHIVO
             * =============================================
             */

            String idParametro =
                    request.getParameter("id");


            if (
                    idParametro == null ||
                            idParametro.isBlank()
            ) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Falta el identificador del archivo."
                );

                return;
            }


            int archivoId =
                    Integer.parseInt(idParametro);


            /*
             * =============================================
             * BUSCAR ARCHIVO EN MYSQL
             * =============================================
             */

            Archivo archivo =
                    archivoDAO.buscarPorId(archivoId);


            if (archivo == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Archivo no encontrado."
                );

                return;
            }


            /*
             * =============================================
             * BUSCAR ARCHIVO FÍSICO
             * =============================================
             */

            Path ruta =
                    ArchivoStorage.resolver(
                            archivo.getRutaArchivo()
                    );


            if (!Files.exists(ruta)) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "El archivo físico no existe."
                );

                return;
            }


            /*
             * =============================================
             * DETECTAR TIPO DE ARCHIVO
             * =============================================
             */

            String tipoContenido =
                    Files.probeContentType(ruta);


            if (tipoContenido == null) {

                tipoContenido =
                        "application/octet-stream";
            }


            response.setContentType(
                    tipoContenido
            );


            /*
             * =============================================
             * TAMAÑO
             * =============================================
             */

            response.setContentLengthLong(
                    Files.size(ruta)
            );


            /*
             * =============================================
             * NOMBRE PARA DESCARGA
             * =============================================
             */

            String nombreArchivo =
                    archivo.getNombreArchivo();


            if (
                    nombreArchivo == null ||
                            nombreArchivo.isBlank()
            ) {

                nombreArchivo =
                        "archivo";
            }


            String nombreCodificado =
                    URLEncoder.encode(
                                    nombreArchivo,
                                    StandardCharsets.UTF_8
                            )
                            .replace("+", "%20");


            response.setHeader(
                    "Content-Disposition",
                    "attachment; filename*=UTF-8''"
                            + nombreCodificado
            );


            /*
             * =============================================
             * ENVIAR ARCHIVO
             * =============================================
             */

            try (
                    InputStream entrada =
                            Files.newInputStream(ruta);

                    OutputStream salida =
                            response.getOutputStream()
            ) {

                entrada.transferTo(salida);
            }


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "El identificador del archivo no es válido."
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "No se pudo descargar el archivo."
            );
        }
    }
}