package com.portafolio.controller;

import com.portafolio.dao.ArchivoDAO;
import com.portafolio.dao.SemanaDAO;
import com.portafolio.dao.TrabajoDAO;
import com.portafolio.model.Semana;
import com.portafolio.model.Trabajo;
import com.portafolio.model.Usuario;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EstudianteSemanaDetalleController {

    private final SemanaDAO semanaDAO = new SemanaDAO();
    private final TrabajoDAO trabajoDAO = new TrabajoDAO();
    private final ArchivoDAO archivoDAO = new ArchivoDAO();

    @GetMapping("/estudiante/semana")
    public String verSemana(
            @RequestParam("id") int semanaId,
            HttpSession session,
            Model model
    ) {

        Usuario usuario =
                (Usuario) session.getAttribute("usuarioLogueado");

        if (usuario == null || !usuario.isEstudiante()) {
            return "redirect:/login";
        }

        Semana semana =
                semanaDAO.buscarPorId(semanaId);

        if (semana == null) {
            return "redirect:/estudiante/semanas";
        }

        List<Trabajo> trabajos =
                trabajoDAO.listarPorSemana(semanaId);

        /*
         * Cargar los archivos de cada trabajo
         */
        for (Trabajo trabajo : trabajos) {

            trabajo.getArchivos().addAll(
                    archivoDAO.listarPorTrabajo(
                            trabajo.getId()
                    )
            );
        }

        model.addAttribute("usuario", usuario);
        model.addAttribute("semana", semana);
        model.addAttribute("trabajos", trabajos);

        return "estudiante/semana-detalle";
    }
}