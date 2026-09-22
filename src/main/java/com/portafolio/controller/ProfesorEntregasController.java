package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.TrabajoDAO;

import com.portafolio.model.Trabajo;
import com.portafolio.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/profesor/entregas")
public class ProfesorEntregasController
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


        List<Trabajo> trabajos =
                trabajoDAO.listarTodos();


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
                "trabajos",
                trabajos
        );


        request.getRequestDispatcher(
                "/views/profesor/entregas.jsp"
        ).forward(
                request,
                response
        );
    }
}