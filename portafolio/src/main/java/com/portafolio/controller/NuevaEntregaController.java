package com.portafolio.controller;

import com.portafolio.dao.SemanaDAO;
import com.portafolio.model.Usuario;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NuevaEntregaController {

    private final SemanaDAO semanaDAO =
            new SemanaDAO();

    @GetMapping("/estudiante/nueva-entrega")
    public String nuevaEntrega(

            @RequestParam(
                    value = "semana",
                    required = false
            )
            Integer semanaId,

            HttpSession session,

            Model model
    ) {

        Usuario usuario =
                (Usuario) session.getAttribute("usuarioLogueado");

        if (usuario == null) {
            return "redirect:/login";
        }

        if (!usuario.isEstudiante()) {
            return "redirect:/login";
        }

        model.addAttribute(
                "usuario",
                usuario
        );

        model.addAttribute(
                "semanas",
                semanaDAO.listar()
        );

        model.addAttribute(
                "semanaSeleccionada",
                semanaId
        );

        return "estudiante/nueva-entrega";
    }
}