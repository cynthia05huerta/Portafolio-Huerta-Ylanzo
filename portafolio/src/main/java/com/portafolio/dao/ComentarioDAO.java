package com.portafolio.dao;

import com.portafolio.model.Comentario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.util.ArrayList;
import java.util.List;


public class ComentarioDAO {


    /*
     * EVALUACIONES DEL ESTUDIANTE
     */
    public List<Comentario>
    listarEvaluacionesPorEstudiante(
            int usuarioId
    ) {

        String sql = """
                SELECT
                    c.id,
                    c.contenido,
                    c.fecha_comentario,
                    c.id_trabajo,
                    c.id_usuario,
                    c.nota,

                    t.titulo
                        AS titulo_trabajo,

                    s.numero_semana

                FROM comentarios c

                INNER JOIN trabajos t
                    ON t.id = c.id_trabajo

                INNER JOIN semanas s
                    ON s.id = t.id_semana

                WHERE t.id_usuario = ?

                ORDER BY
                    s.numero_semana DESC,
                    c.fecha_comentario DESC
                """;


        List<Comentario> lista =
                new ArrayList<>();


        try (
                Connection con =
                        ConexionBD.getConexion();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    usuarioId
            );


            try (
                    ResultSet rs =
                            ps.executeQuery()
            ) {

                while (rs.next()) {

                    Comentario comentario =
                            mapear(rs);


                    comentario.setTituloTrabajo(
                            rs.getString(
                                    "titulo_trabajo"
                            )
                    );


                    comentario.setNumeroSemana(
                            rs.getInt(
                                    "numero_semana"
                            )
                    );


                    lista.add(
                            comentario
                    );
                }
            }


        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudieron listar las evaluaciones",
                    e
            );
        }


        return lista;
    }


    /*
     * TODAS LAS EVALUACIONES DEL DOCENTE
     */
    public List<Comentario>
    listarTodasEvaluaciones() {

        String sql = """
                SELECT
                    c.id,
                    c.contenido,
                    c.fecha_comentario,
                    c.id_trabajo,
                    c.id_usuario,
                    c.nota,

                    t.titulo
                        AS titulo_trabajo,

                    s.numero_semana

                FROM comentarios c

                INNER JOIN trabajos t
                    ON t.id = c.id_trabajo

                INNER JOIN semanas s
                    ON s.id = t.id_semana

                ORDER BY
                    c.fecha_comentario DESC
                """;


        List<Comentario> lista =
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

                Comentario comentario =
                        mapear(rs);


                comentario.setTituloTrabajo(
                        rs.getString(
                                "titulo_trabajo"
                        )
                );


                comentario.setNumeroSemana(
                        rs.getInt(
                                "numero_semana"
                        )
                );


                lista.add(
                        comentario
                );
            }


        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudieron listar las evaluaciones",
                    e
            );
        }


        return lista;
    }


    /*
     * BUSCAR EVALUACIÓN
     */
    public Comentario buscarPorTrabajo(
            int trabajoId
    ) {

        String sql = """
                SELECT
                    id,
                    contenido,
                    fecha_comentario,
                    id_trabajo,
                    id_usuario,
                    nota

                FROM comentarios

                WHERE id_trabajo = ?

                ORDER BY id DESC

                LIMIT 1
                """;


        try (
                Connection con =
                        ConexionBD.getConexion();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    trabajoId
            );


            try (
                    ResultSet rs =
                            ps.executeQuery()
            ) {

                if (rs.next()) {

                    return mapear(rs);
                }
            }


        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo buscar la evaluación",
                    e
            );
        }


        return null;
    }


    /*
     * CREAR
     */
    public boolean guardarEvaluacion(
            int trabajoId,
            int profesorId,
            String contenido,
            double nota
    ) {

        String sql = """
                INSERT INTO comentarios
                (
                    contenido,
                    fecha_comentario,
                    id_trabajo,
                    id_usuario,
                    nota
                )

                VALUES (
                    ?,
                    CURRENT_TIMESTAMP,
                    ?,
                    ?,
                    ?
                )
                """;


        try (
                Connection con =
                        ConexionBD.getConexion();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setString(
                    1,
                    contenido
            );

            ps.setInt(
                    2,
                    trabajoId
            );

            ps.setInt(
                    3,
                    profesorId
            );

            ps.setDouble(
                    4,
                    nota
            );


            return ps.executeUpdate() > 0;


        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo guardar la evaluación",
                    e
            );
        }
    }


    /*
     * ACTUALIZAR
     */
    public boolean actualizarEvaluacion(
            int evaluacionId,
            int profesorId,
            String contenido,
            double nota
    ) {

        String sql = """
                UPDATE comentarios

                SET
                    contenido = ?,
                    nota = ?,
                    id_usuario = ?,
                    fecha_comentario =
                        CURRENT_TIMESTAMP

                WHERE id = ?
                """;


        try (
                Connection con =
                        ConexionBD.getConexion();

                PreparedStatement ps =
                        con.prepareStatement(sql)
        ) {

            ps.setString(
                    1,
                    contenido
            );

            ps.setDouble(
                    2,
                    nota
            );

            ps.setInt(
                    3,
                    profesorId
            );

            ps.setInt(
                    4,
                    evaluacionId
            );


            return ps.executeUpdate() > 0;


        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo actualizar la evaluación",
                    e
            );
        }
    }


    public boolean guardarOActualizar(
            int trabajoId,
            int profesorId,
            String contenido,
            double nota
    ) {

        Comentario existente =
                buscarPorTrabajo(
                        trabajoId
                );


        if (existente == null) {

            return guardarEvaluacion(
                    trabajoId,
                    profesorId,
                    contenido,
                    nota
            );
        }


        return actualizarEvaluacion(
                existente.getId(),
                profesorId,
                contenido,
                nota
        );
    }


    private Comentario mapear(
            ResultSet rs
    ) throws SQLException {

        Comentario comentario =
                new Comentario();


        comentario.setId(
                rs.getInt("id")
        );


        comentario.setContenido(
                rs.getString(
                        "contenido"
                )
        );


        comentario.setTrabajoId(
                rs.getInt(
                        "id_trabajo"
                )
        );


        comentario.setUsuarioId(
                rs.getInt(
                        "id_usuario"
                )
        );


        double nota =
                rs.getDouble(
                        "nota"
                );


        if (rs.wasNull()) {

            comentario.setNota(
                    null
            );

        } else {

            comentario.setNota(
                    nota
            );
        }


        Timestamp fecha =
                rs.getTimestamp(
                        "fecha_comentario"
                );


        if (fecha != null) {

            comentario.setFechaComentario(
                    fecha.toLocalDateTime()
            );
        }


        return comentario;
    }
}