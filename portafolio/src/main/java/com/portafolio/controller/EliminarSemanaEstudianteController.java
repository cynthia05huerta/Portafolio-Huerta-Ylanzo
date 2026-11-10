package com.portafolio.controller;

import com.portafolio.dao.SemanaDAO;
import com.portafolio.model.Usuario;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/estudiante/semana/eliminar")
public class EliminarSemanaEstudianteController
        extends HttpServlet {

    private final SemanaDAO semanaDAO =
            new SemanaDAO();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException {

        Usuario estudiante =
                (Usuario) request.getSession()
                        .getAttribute("usuarioLogueado");

        if (estudiante == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );

            return;
        }

        if (!estudiante.isEstudiante()) {

            response.sendError(
                    HttpServletResponse.SC_FORBIDDEN
            );

            return;
        }

        try {

            int id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            boolean eliminado =
                    semanaDAO.eliminar(id);

            if (eliminado) {

                request.getSession()
                        .setAttribute(
                                "flash",
                                "Semana eliminada correctamente."
                        );

            } else {

                request.getSession()
                        .setAttribute(
                                "flashError",
                                "No puedes eliminar esta semana porque contiene trabajos."
                        );
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.getSession()
                    .setAttribute(
                            "flashError",
                            "No se pudo eliminar la semana."
                    );
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/estudiante/semanas"
        );
    }
}