package com.portafolio.controller;

import com.portafolio.model.Usuario;
import com.portafolio.service.UsuarioService;

import jakarta.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class LoginController {


    private final UsuarioService usuarioService =
            new UsuarioService();


    /*
     * =====================================================
     * MOSTRAR LOGIN
     * =====================================================
     */
    @GetMapping("/login")
    public String mostrarLogin(
            HttpSession session
    ) {


        /*
         * Si ya inició sesión,
         * enviarlo a su dashboard.
         */
        Usuario usuario =
                (Usuario) session.getAttribute(
                        "usuarioLogueado"
                );


        if (usuario != null) {


            if (usuario.isEstudiante()) {

                return "redirect:/estudiante/dashboard";
            }


            if (usuario.isProfesor()) {

                return "redirect:/profesor/dashboard";
            }
        }


        return "auth/login";
    }


    /*
     * =====================================================
     * PROCESAR LOGIN
     * =====================================================
     */
    @PostMapping("/login")
    public String procesarLogin(


            @RequestParam("correo")
            String correo,


            @RequestParam("password")
            String password,


            @RequestParam(
                    value = "tipoUsuario",
                    required = false
            )
            String tipoUsuario,


            HttpSession session,


            Model model
    ) {


        /*
         * =================================================
         * VALIDAR CAMPOS
         * =================================================
         */

        if (
                correo == null ||
                        correo.isBlank()
        ) {

            model.addAttribute(
                    "error",
                    "Ingresa tu correo electrónico."
            );


            model.addAttribute(
                    "tipoSeleccionado",
                    normalizarTipoUsuario(
                            tipoUsuario
                    )
            );


            return "auth/login";
        }


        if (
                password == null ||
                        password.isBlank()
        ) {

            model.addAttribute(
                    "error",
                    "Ingresa tu contraseña."
            );


            model.addAttribute(
                    "correoIngresado",
                    correo
            );


            model.addAttribute(
                    "tipoSeleccionado",
                    normalizarTipoUsuario(
                            tipoUsuario
                    )
            );


            return "auth/login";
        }


        /*
         * =================================================
         * VALIDAR ROL ELEGIDO
         * =================================================
         */

        if (
                tipoUsuario == null ||
                        tipoUsuario.isBlank()
        ) {

            model.addAttribute(
                    "error",
                    "Selecciona Estudiante o Docente."
            );


            model.addAttribute(
                    "correoIngresado",
                    correo
            );


            return "auth/login";
        }


        tipoUsuario =
                tipoUsuario
                        .trim()
                        .toLowerCase();


        /*
         * Seguridad:
         * solo permitimos estos dos valores.
         */
        if (
                !tipoUsuario.equals("estudiante")
                        &&
                        !tipoUsuario.equals("profesor")
        ) {

            model.addAttribute(
                    "error",
                    "El tipo de usuario seleccionado no es válido."
            );


            model.addAttribute(
                    "correoIngresado",
                    correo
            );


            return "auth/login";
        }


        /*
         * =================================================
         * VALIDAR CORREO Y CONTRASEÑA
         * =================================================
         */

        Usuario usuario =
                usuarioService.login(
                        correo,
                        password
                );


        /*
         * CREDENCIALES INCORRECTAS
         */
        if (usuario == null) {


            model.addAttribute(
                    "error",
                    "Correo electrónico o contraseña incorrectos."
            );


            model.addAttribute(
                    "correoIngresado",
                    correo
            );


            model.addAttribute(
                    "tipoSeleccionado",
                    tipoUsuario
            );


            return "auth/login";
        }


        /*
         * =================================================
         * VALIDACIÓN IMPORTANTE DEL ROL
         * =================================================
         *
         * Aquí está la solución a tu problema.
         *
         * No basta que el correo y contraseña sean
         * correctos.
         *
         * También debe coincidir el rol seleccionado
         * con el rol que tiene el usuario en MySQL.
         */


        /*
         * =================================================
         * SELECCIONÓ ESTUDIANTE
         * =================================================
         */

        if (
                tipoUsuario.equals(
                        "estudiante"
                )
        ) {


            /*
             * Si realmente NO es estudiante,
             * NO LO DEJAMOS ENTRAR.
             */
            if (!usuario.isEstudiante()) {


                model.addAttribute(
                        "error",
                        "Estas credenciales pertenecen a una cuenta docente. Selecciona Docente para ingresar."
                );


                model.addAttribute(
                        "correoIngresado",
                        correo
                );


                model.addAttribute(
                        "tipoSeleccionado",
                        "estudiante"
                );


                /*
                 * MUY IMPORTANTE:
                 * NO guardamos sesión.
                 */
                return "auth/login";
            }
        }


        /*
         * =================================================
         * SELECCIONÓ DOCENTE
         * =================================================
         */

        if (
                tipoUsuario.equals(
                        "profesor"
                )
        ) {


            /*
             * Si realmente NO es profesor,
             * NO LO DEJAMOS ENTRAR.
             */
            if (!usuario.isProfesor()) {


                model.addAttribute(
                        "error",
                        "Estas credenciales pertenecen a una cuenta de estudiante. Selecciona Estudiante para ingresar."
                );


                model.addAttribute(
                        "correoIngresado",
                        correo
                );


                model.addAttribute(
                        "tipoSeleccionado",
                        "profesor"
                );


                /*
                 * NO guardamos sesión.
                 */
                return "auth/login";
            }
        }


        /*
         * =================================================
         * LOGIN CORRECTO
         * =================================================
         *
         * Solo llegamos aquí si:
         *
         * correo       ✅
         * contraseña  ✅
         * rol elegido ✅
         * rol MySQL   ✅
         */


        session.setAttribute(
                "usuarioLogueado",
                usuario
        );


        /*
         * =================================================
         * REDIRECCIONAR
         * =================================================
         */


        /*
         * ESTUDIANTE
         */
        if (usuario.isEstudiante()) {

            return "redirect:/estudiante/dashboard";
        }


        /*
         * DOCENTE
         */
        if (usuario.isProfesor()) {

            return "redirect:/profesor/dashboard";
        }


        /*
         * =================================================
         * SEGURIDAD ADICIONAL
         * =================================================
         */

        session.invalidate();


        model.addAttribute(
                "error",
                "Tu cuenta no tiene un rol válido."
        );


        return "auth/login";
    }


    /*
     * =====================================================
     * NORMALIZAR ROL
     * =====================================================
     */
    private String normalizarTipoUsuario(
            String tipoUsuario
    ) {


        if (
                tipoUsuario != null
                        &&
                        tipoUsuario.equalsIgnoreCase(
                                "profesor"
                        )
        ) {

            return "profesor";
        }


        return "estudiante";
    }
}