package com.portafolio.controller;

import com.portafolio.dao.SemanaDAO;
import com.portafolio.model.Usuario;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CrearSemanaEstudianteController {

    private final SemanaDAO semanaDAO = new SemanaDAO();

    @GetMapping("/estudiante/semana/nueva")
    public String mostrarFormulario(
            HttpSession session,
            Model model
    ) {

        Usuario usuario =
                (Usuario) session.getAttribute("usuarioLogueado");

        if (usuario == null || !usuario.isEstudiante()) {
            return "redirect:/login";
        }

        model.addAttribute("usuario", usuario);

        return "estudiante/nueva-semana";
    }

    @PostMapping("/estudiante/semana/nueva")
    public String guardarSemana(

            @RequestParam("numero")
            int numero,

            @RequestParam("titulo")
            String titulo,

            @RequestParam(
                    value = "descripcion",
                    required = false
            )
            String descripcion,

            HttpSession session
    ) {

        Usuario usuario =
                (Usuario) session.getAttribute("usuarioLogueado");

        if (usuario == null || !usuario.isEstudiante()) {
            return "redirect:/login";
        }

        try {

            semanaDAO.crear(
                    numero,
                    titulo.trim(),
                    descripcion == null
                            ? ""
                            : descripcion.trim()
            );

            session.setAttribute(
                    "flash",
                    "Semana creada correctamente."
            );

        } catch (Exception e) {

            e.printStackTrace();

            session.setAttribute(
                    "flashError",
                    "No se pudo crear la semana."
            );
        }

        return "redirect:/estudiante/semanas";
    }
}