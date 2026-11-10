package com.portafolio.dao;

import com.portafolio.model.Trabajo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;

import java.util.ArrayList;
import java.util.List;

public class TrabajoDAO {


    public int crear(Trabajo trabajo) {

        String sql = """
                INSERT INTO trabajos
                (
                    titulo,
                    descripcion,
                    id_usuario,
                    id_semana,
                    enlace_externo
                )
                VALUES (?, ?, ?, ?, ?)
                """;

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(
                        sql,
                        Statement.RETURN_GENERATED_KEYS
                )
        ) {

            ps.setString(1, trabajo.getTitulo());
            ps.setString(2, trabajo.getDescripcion());
            ps.setInt(3, trabajo.getUsuarioId());
            ps.setInt(4, trabajo.getSemanaId());

            if (
                    trabajo.getEnlaceExterno() == null ||
                            trabajo.getEnlaceExterno().isBlank()
            ) {

                ps.setNull(5, Types.VARCHAR);

            } else {

                ps.setString(
                        5,
                        trabajo.getEnlaceExterno()
                );
            }

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {

                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo crear el trabajo",
                    e
            );
        }

        return 0;
    }


    public List<Trabajo> listarPorSemana(int semanaId) {

        String sql = """
                SELECT
                    id,
                    titulo,
                    descripcion,
                    fecha_entrega,
                    id_usuario,
                    id_semana,
                    enlace_externo
                FROM trabajos
                WHERE id_semana = ?
                ORDER BY fecha_entrega DESC
                """;

        List<Trabajo> lista = new ArrayList<>();

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, semanaId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    lista.add(
                            mapear(rs)
                    );
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudieron listar los trabajos",
                    e
            );
        }

        return lista;
    }


    public List<Trabajo> listarPorUsuario(int usuarioId) {

        String sql = """
                SELECT
                    id,
                    titulo,
                    descripcion,
                    fecha_entrega,
                    id_usuario,
                    id_semana,
                    enlace_externo
                FROM trabajos
                WHERE id_usuario = ?
                ORDER BY fecha_entrega DESC
                """;

        List<Trabajo> lista = new ArrayList<>();

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, usuarioId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    lista.add(
                            mapear(rs)
                    );
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudieron listar las entregas",
                    e
            );
        }

        return lista;
    }


    public Trabajo buscarPorId(int id) {

        String sql = """
                SELECT
                    id,
                    titulo,
                    descripcion,
                    fecha_entrega,
                    id_usuario,
                    id_semana,
                    enlace_externo
                FROM trabajos
                WHERE id = ?
                LIMIT 1
                """;

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return mapear(rs);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo buscar el trabajo",
                    e
            );
        }

        return null;
    }


    public boolean actualizar(Trabajo trabajo) {

        String sql = """
                UPDATE trabajos
                SET
                    titulo = ?,
                    descripcion = ?,
                    enlace_externo = ?
                WHERE id = ?
                  AND id_usuario = ?
                """;

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(
                    1,
                    trabajo.getTitulo()
            );

            ps.setString(
                    2,
                    trabajo.getDescripcion()
            );

            if (
                    trabajo.getEnlaceExterno() == null ||
                            trabajo.getEnlaceExterno().isBlank()
            ) {

                ps.setNull(
                        3,
                        Types.VARCHAR
                );

            } else {

                ps.setString(
                        3,
                        trabajo.getEnlaceExterno()
                );
            }

            ps.setInt(
                    4,
                    trabajo.getId()
            );

            ps.setInt(
                    5,
                    trabajo.getUsuarioId()
            );

            int filas =
                    ps.executeUpdate();

            return filas > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo actualizar el trabajo",
                    e
            );
        }
    }


    public boolean eliminar(
            int trabajoId,
            int usuarioId
    ) {

        String sql = """
                DELETE FROM trabajos
                WHERE id = ?
                  AND id_usuario = ?
                """;

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, trabajoId);
            ps.setInt(2, usuarioId);

            int filas =
                    ps.executeUpdate();

            return filas > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo eliminar el trabajo",
                    e
            );
        }
    }


    private Trabajo mapear(ResultSet rs)
            throws SQLException {

        Trabajo trabajo =
                new Trabajo();

        trabajo.setId(
                rs.getInt("id")
        );

        trabajo.setTitulo(
                rs.getString("titulo")
        );

        trabajo.setDescripcion(
                rs.getString("descripcion")
        );

        trabajo.setUsuarioId(
                rs.getInt("id_usuario")
        );

        trabajo.setSemanaId(
                rs.getInt("id_semana")
        );

        trabajo.setEnlaceExterno(
                rs.getString("enlace_externo")
        );

        Timestamp fecha =
                rs.getTimestamp("fecha_entrega");

        if (fecha != null) {

            trabajo.setFechaEntrega(
                    fecha.toLocalDateTime()
            );
        }

        return trabajo;
    }

    public List<Trabajo> listarTodos() {

        String sql = """
            SELECT
                id,
                titulo,
                descripcion,
                fecha_entrega,
                id_usuario,
                id_semana,
                enlace_externo

            FROM trabajos

            ORDER BY
                fecha_entrega DESC,
                id DESC
            """;


        List<Trabajo> lista =
                new ArrayList<>();


        try (
                Connection con =
                        ConexionBD.getConexion();

                PreparedStatement ps =
                        con.prepareStatement(sql);

                ResultSet rs =
                        ps.executeQuery()
        ) {

            while (rs.next()) {

                lista.add(
                        mapear(rs)
                );
            }


        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudieron listar las entregas",
                    e
            );
        }


        return lista;
    }
}