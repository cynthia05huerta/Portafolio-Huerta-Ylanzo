package com.portafolio.controller;

import com.portafolio.model.Usuario;
import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EstudianteDashboardController {

    @GetMapping("/estudiante/dashboard")
    public String dashboardEstudiante(
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

        model.addAttribute("usuario", usuario);

        return "estudiante/dashboard";
    }
}