package com.portafolio.dao;

import com.portafolio.model.Archivo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class ArchivoDAO {

    public void guardar(Archivo archivo) {

        String sql =
                "INSERT INTO archivos " +
                        "(nombre_archivo, ruta_archivo, id_trabajo) " +
                        "VALUES (?, ?, ?)";

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(
                    1,
                    archivo.getNombreArchivo()
            );

            ps.setString(
                    2,
                    archivo.getRutaArchivo()
            );

            ps.setInt(
                    3,
                    archivo.getTrabajoId()
            );

            ps.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo registrar el archivo",
                    e
            );
        }
    }


    public List<Archivo> listarPorTrabajo(int trabajoId) {

        String sql =
                "SELECT id, nombre_archivo, ruta_archivo, id_trabajo " +
                        "FROM archivos " +
                        "WHERE id_trabajo = ? " +
                        "ORDER BY id DESC";

        List<Archivo> lista =
                new ArrayList<>();

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    trabajoId
            );

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
                    "No se pudieron listar los archivos",
                    e
            );
        }

        return lista;
    }


    public Archivo buscarPorId(int id) {

        String sql =
                "SELECT id, nombre_archivo, ruta_archivo, id_trabajo " +
                        "FROM archivos " +
                        "WHERE id = ? " +
                        "LIMIT 1";

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    id
            );

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return mapear(rs);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo buscar el archivo",
                    e
            );
        }

        return null;
    }


    public void eliminarPorId(int id) {

        String sql =
                "DELETE FROM archivos WHERE id = ?";

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    id
            );

            ps.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudo eliminar el archivo",
                    e
            );
        }
    }


    public void eliminarPorTrabajo(int trabajoId) {

        String sql =
                "DELETE FROM archivos WHERE id_trabajo = ?";

        try (
                Connection con = ConexionBD.getConexion();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    trabajoId
            );

            ps.executeUpdate();

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "No se pudieron eliminar los archivos del trabajo",
                    e
            );
        }
    }


    private Archivo mapear(ResultSet rs)
            throws SQLException {

        Archivo archivo =
                new Archivo();

        archivo.setId(
                rs.getInt("id")
        );

        archivo.setNombreArchivo(
                rs.getString("nombre_archivo")
        );

        archivo.setRutaArchivo(
                rs.getString("ruta_archivo")
        );

        archivo.setTrabajoId(
                rs.getInt("id_trabajo")
        );

        return archivo;
    }
}