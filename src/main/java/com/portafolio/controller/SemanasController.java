package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.SemanaDAO;
import com.portafolio.dao.TrabajoDAO;

import com.portafolio.model.Semana;
import com.portafolio.model.Trabajo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.util.List;


@WebServlet("/semanas")
public class SemanasController
        extends HttpServlet {


    private final SemanaDAO semanaDAO =
            new SemanaDAO();


    private final TrabajoDAO trabajoDAO =
            new TrabajoDAO();


    private final ArchivoDAO archivoDAO =
            new ArchivoDAO();


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {


        /*
         * ===============================================
         * SI NO HAY ID:
         * MOSTRAR TODAS LAS SEMANAS
         * ===============================================
         */

        String parametroId =
                request.getParameter("id");


        if (
                parametroId == null ||
                        parametroId.isBlank()
        ) {

            List<Semana> semanas =
                    semanaDAO.listar();


            request.setAttribute(
                    "semanas",
                    semanas
            );


            request.getRequestDispatcher(
                    "/views/semanas.jsp"
            ).forward(
                    request,
                    response
            );


            return;
        }


        /*
         * ===============================================
         * SI HAY ID:
         * ABRIR DETALLE DE UNA SEMANA
         * ===============================================
         */

        try {

            int semanaId =
                    Integer.parseInt(
                            parametroId
                    );


            Semana semana =
                    semanaDAO.buscarPorId(
                            semanaId
                    );


            if (semana == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Semana no encontrada."
                );

                return;
            }


            List<Trabajo> trabajos =
                    trabajoDAO.listarPorSemana(
                            semanaId
                    );


            /*
             * CARGAR ARCHIVOS DE CADA TRABAJO
             */

            for (Trabajo trabajo : trabajos) {

                trabajo.getArchivos()
                        .addAll(

                                archivoDAO
                                        .listarPorTrabajo(
                                                trabajo.getId()
                                        )

                        );
            }


            request.setAttribute(
                    "semana",
                    semana
            );


            request.setAttribute(
                    "trabajos",
                    trabajos
            );


            request.getRequestDispatcher(
                    "/views/semanas/detalle.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Identificador de semana no válido."
            );
        }
    }
}