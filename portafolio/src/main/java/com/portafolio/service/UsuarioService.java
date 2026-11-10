package com.portafolio.service;

import com.portafolio.dao.UsuarioDAO;
import com.portafolio.model.Usuario;


public class UsuarioService {


    private final UsuarioDAO usuarioDAO =
            new UsuarioDAO();


    /*
     * =====================================================
     * INICIAR SESIÓN
     * =====================================================
     */
    public Usuario login(
            String correo,
            String password
    ) {


        if (
                correo == null ||
                        correo.isBlank() ||
                        password == null ||
                        password.isBlank()
        ) {

            return null;
        }


        correo =
                correo
                        .trim()
                        .toLowerCase();


        Usuario usuario =
                usuarioDAO.buscarPorCorreo(
                        correo
                );


        if (usuario == null) {

            return null;
        }


        String passwordGuardado =
                usuario.getPassword();


        if (passwordGuardado == null) {

            return null;
        }


        /*
         * Comparar contraseña.
         *
         * En tu proyecto actual las contraseñas
         * están guardadas directamente en la BD.
         */
        boolean passwordCorrecto =
                passwordGuardado.equals(
                        password
                );


        if (!passwordCorrecto) {

            return null;
        }


        return usuario;
    }
}