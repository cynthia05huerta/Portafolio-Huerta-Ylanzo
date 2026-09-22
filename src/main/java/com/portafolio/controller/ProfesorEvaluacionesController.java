package com.portafolio.controller;

import com.portafolio.dao.ComentarioDAO;

import com.portafolio.model.Comentario;
import com.portafolio.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/profesor/evaluaciones")
public class ProfesorEvaluacionesController
        extends HttpServlet {


    private final ComentarioDAO comentarioDAO =
            new ComentarioDAO();


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


        List<Comentario> evaluaciones =
                comentarioDAO
                        .listarTodasEvaluaciones();


        request.setAttribute(
                "evaluaciones",
                evaluaciones
        );


        request.getRequestDispatcher(
                "/views/profesor/evaluaciones.jsp"
        ).forward(
                request,
                response
        );
    }
}