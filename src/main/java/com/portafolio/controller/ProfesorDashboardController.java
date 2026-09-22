package com.portafolio.controller;

import com.portafolio.dao.SemanaDAO;

import com.portafolio.model.Semana;
import com.portafolio.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/profesor/dashboard")
public class ProfesorDashboardController
        extends HttpServlet {


    private final SemanaDAO semanaDAO =
            new SemanaDAO();


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {


        Usuario profesor =
                obtenerProfesor(
                        request,
                        response
                );


        if (profesor == null) {
            return;
        }


        List<Semana> semanas =
                semanaDAO.listar();


        request.setAttribute(
                "usuario",
                profesor
        );


        request.setAttribute(
                "semanas",
                semanas
        );


        request.getRequestDispatcher(
                "/views/profesor/dashboard.jsp"
        ).forward(
                request,
                response
        );
    }


    private Usuario obtenerProfesor(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

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

            return null;
        }


        if (!usuario.isProfesor()) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "Acceso exclusivo para docentes."
            );

            return null;
        }


        return usuario;
    }
}