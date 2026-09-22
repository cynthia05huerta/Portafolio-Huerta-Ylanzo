package com.portafolio.dao;

import com.portafolio.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UsuarioDAO {


    /*
     * =====================================================
     * BUSCAR POR CORREO
     * =====================================================
     */
    public Usuario buscarPorCorreo(
            String correo
    ) {


        String sql = """
                SELECT
                    u.id,
                    u.nombre,
                    u.correo,
                    u.password,
                    u.id_rol,

                    r.nombre AS rol_nombre

                FROM usuarios u

                INNER JOIN roles r
                    ON r.id = u.id_rol

                WHERE LOWER(u.correo) = LOWER(?)

                LIMIT 1
                """;


        try (
                Connection con =
                        ConexionBD.getConexion();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {


            ps.setString(
                    1,
                    correo
            );


            try (
                    ResultSet rs =
                            ps.executeQuery()
            ) {


                if (rs.next()) {


                    Usuario usuario =
                            new Usuario();


                    usuario.setId(
                            rs.getInt("id")
                    );


                    usuario.setNombre(
                            rs.getString("nombre")
                    );


                    usuario.setCorreo(
                            rs.getString("correo")
                    );


                    usuario.setPassword(
                            rs.getString("password")
                    );


                    usuario.setIdRol(
                            rs.getInt("id_rol")
                    );


                    /*
                     * MUY IMPORTANTE.
                     *
                     * Aquí Java obtiene:
                     *
                     * Estudiante
                     * Profesor
                     * Administrador
                     */
                    usuario.setRolNombre(
                            rs.getString(
                                    "rol_nombre"
                            )
                    );


                    return usuario;
                }
            }


        } catch (SQLException e) {


            e.printStackTrace();


            throw new RuntimeException(
                    "No se pudo buscar el usuario por correo.",
                    e
            );
        }


        return null;
    }
}