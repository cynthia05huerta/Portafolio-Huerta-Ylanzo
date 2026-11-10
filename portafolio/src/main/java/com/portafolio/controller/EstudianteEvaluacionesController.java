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


@WebServlet("/estudiante/evaluaciones")
public class EstudianteEvaluacionesController
        extends HttpServlet {


    private final ComentarioDAO comentarioDAO =
            new ComentarioDAO();


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {


        Usuario estudiante =
                (Usuario) request
                        .getSession()
                        .getAttribute(
                                "usuarioLogueado"
                        );


        if (estudiante == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }


        if (!estudiante.isEstudiante()) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN,
                    "No tienes permiso para acceder."
            );

            return;
        }


        List<Comentario> evaluaciones =
                comentarioDAO
                        .listarEvaluacionesPorEstudiante(
                                estudiante.getId()
                        );


        request.setAttribute(
                "usuario",
                estudiante
        );


        request.setAttribute(
                "evaluaciones",
                evaluaciones
        );


        request.getRequestDispatcher(
                "/views/estudiante/evaluaciones.jsp"
        ).forward(
                request,
                response
        );
    }
}