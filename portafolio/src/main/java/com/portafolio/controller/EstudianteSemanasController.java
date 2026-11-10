package com.portafolio.controller;

import com.portafolio.dao.SemanaDAO;
import com.portafolio.model.Semana;
import com.portafolio.model.Usuario;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class EstudianteSemanasController {

    private final SemanaDAO semanaDAO = new SemanaDAO();

    @GetMapping("/estudiante/semanas")
    public String verSemanas(
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

        List<Semana> semanas =
                semanaDAO.listar();

        model.addAttribute("usuario", usuario);
        model.addAttribute("semanas", semanas);

        return "estudiante/semanas";
    }
}