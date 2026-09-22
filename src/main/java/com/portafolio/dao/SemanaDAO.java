package com.portafolio.dao;

import com.portafolio.model.Semana;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class SemanaDAO {

    /*
     * =====================================================
     * LISTAR TODAS LAS SEMANAS
     * =====================================================
     */
    public List<Semana> listar() {

        String sql = """
                SELECT
                    s.id,
                    s.numero_semana,
                    s.titulo,
                    s.descripcion,
                    s.fecha_inicio,
                    s.fecha_fin,
                    s.estado,

                    (
                        SELECT COUNT(*)
                        FROM trabajos t
                        WHERE t.id_semana = s.id
                    ) AS total_trabajos

                FROM semanas s
                ORDER BY s.numero_semana
                """;

        List<Semana> lista = new ArrayList<>();

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {
                lista.add(mapear(rs));
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudieron listar las semanas.",
                    e
            );
        }

        return lista;
    }


    /*
     * =====================================================
     * BUSCAR SEMANA POR ID
     * =====================================================
     */
    public Semana buscarPorId(int id) {

        String sql = """
                SELECT
                    s.id,
                    s.numero_semana,
                    s.titulo,
                    s.descripcion,
                    s.fecha_inicio,
                    s.fecha_fin,
                    s.estado,

                    (
                        SELECT COUNT(*)
                        FROM trabajos t
                        WHERE t.id_semana = s.id
                    ) AS total_trabajos

                FROM semanas s
                WHERE s.id = ?
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
                    "No se pudo buscar la semana.",
                    e
            );
        }

        return null;
    }


    /*
     * =====================================================
     * CREAR NUEVA SEMANA
     * =====================================================
     */
    public void crear(
            int numero,
            String titulo,
            String descripcion
    ) {

        String sql = """
                INSERT INTO semanas
                (
                    numero_semana,
                    titulo,
                    descripcion,
                    estado
                )
                VALUES (?, ?, ?, 1)
                """;

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, numero);
            ps.setString(2, titulo);
            ps.setString(3, descripcion);

            ps.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo crear la semana.",
                    e
            );
        }
    }


    /*
     * =====================================================
     * ACTUALIZAR SEMANA
     * =====================================================
     */
    public boolean actualizar(Semana semana) {

        String sql = """
                UPDATE semanas
                SET
                    numero_semana = ?,
                    titulo = ?,
                    descripcion = ?
                WHERE id = ?
                """;

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    semana.getNumero()
            );

            ps.setString(
                    2,
                    semana.getTitulo()
            );

            ps.setString(
                    3,
                    semana.getDescripcion()
            );

            ps.setInt(
                    4,
                    semana.getId()
            );

            int filasActualizadas =
                    ps.executeUpdate();

            return filasActualizadas > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo actualizar la semana.",
                    e
            );
        }
    }


    /*
     * =====================================================
     * ELIMINAR SEMANA
     * =====================================================
     *
     * Solo se elimina si NO tiene trabajos.
     * =====================================================
     */
    public boolean eliminar(int semanaId) {

        String verificarTrabajos = """
                SELECT COUNT(*) AS cantidad
                FROM trabajos
                WHERE id_semana = ?
                """;

        String eliminarSemana = """
                DELETE FROM semanas
                WHERE id = ?
                """;

        try (
                Connection con = ConexionBD.getConexion()
        ) {

            /*
             * Verificamos si existen trabajos.
             */
            try (
                    PreparedStatement ps =
                            con.prepareStatement(verificarTrabajos)
            ) {

                ps.setInt(1, semanaId);

                try (
                        ResultSet rs =
                                ps.executeQuery()
                ) {

                    if (rs.next()) {

                        int cantidad =
                                rs.getInt("cantidad");

                        if (cantidad > 0) {

                            // La semana tiene trabajos.
                            // No se elimina.
                            return false;
                        }
                    }
                }
            }


            /*
             * Eliminamos la semana
             * solamente si está vacía.
             */
            try (
                    PreparedStatement ps =
                            con.prepareStatement(eliminarSemana)
            ) {

                ps.setInt(1, semanaId);

                int filasEliminadas =
                        ps.executeUpdate();

                return filasEliminadas > 0;
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo eliminar la semana.",
                    e
            );
        }
    }


    /*
     * =====================================================
     * VERIFICAR SI UNA SEMANA TIENE TRABAJOS
     * =====================================================
     */
    public boolean tieneTrabajos(int semanaId) {

        String sql = """
                SELECT COUNT(*) AS cantidad
                FROM trabajos
                WHERE id_semana = ?
                """;

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, semanaId);

            try (
                    ResultSet rs =
                            ps.executeQuery()
            ) {

                if (rs.next()) {

                    return rs.getInt(
                            "cantidad"
                    ) > 0;
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo verificar los trabajos de la semana.",
                    e
            );
        }

        return false;
    }


    /*
     * =====================================================
     * MAPEAR RESULTADO SQL A OBJETO SEMANA
     * =====================================================
     */
    private Semana mapear(ResultSet rs)
            throws SQLException {

        Semana semana =
                new Semana();

        semana.setId(
                rs.getInt("id")
        );

        semana.setNumero(
                rs.getInt("numero_semana")
        );

        semana.setTitulo(
                rs.getString("titulo")
        );

        semana.setDescripcion(
                rs.getString("descripcion")
        );

        semana.setEstado(
                rs.getBoolean("estado")
        );

        semana.setTotalTrabajos(
                rs.getInt("total_trabajos")
        );


        /*
         * FECHA DE INICIO
         */
        Date fechaInicio =
                rs.getDate("fecha_inicio");

        if (fechaInicio != null) {

            semana.setFechaInicio(
                    fechaInicio.toLocalDate()
            );
        }


        /*
         * FECHA DE FIN
         */
        Date fechaFin =
                rs.getDate("fecha_fin");

        if (fechaFin != null) {

            semana.setFechaFin(
                    fechaFin.toLocalDate()
            );
        }


        return semana;
    }
}