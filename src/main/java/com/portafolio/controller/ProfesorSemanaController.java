package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.SemanaDAO;
import com.portafolio.dao.TrabajoDAO;

import com.portafolio.model.Semana;
import com.portafolio.model.Trabajo;
import com.portafolio.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet({
        "/profesor/semanas",
        "/profesor/semana"
})
public class ProfesorSemanaController
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


        String ruta =
                request.getServletPath();


        /*
         * LISTA
         */
        if (
                "/profesor/semanas"
                        .equals(ruta)
        ) {

            request.setAttribute(
                    "semanas",
                    semanaDAO.listar()
            );


            request.getRequestDispatcher(
                    "/views/profesor/semanas.jsp"
            ).forward(
                    request,
                    response
            );

            return;
        }


        /*
         * DETALLE
         */
        try {

            int semanaId =
                    Integer.parseInt(
                            request.getParameter(
                                    "id"
                            )
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


            for (Trabajo trabajo : trabajos) {

                trabajo.getArchivos()
                        .clear();


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
                    "/views/profesor/semana-detalle.jsp"
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
}