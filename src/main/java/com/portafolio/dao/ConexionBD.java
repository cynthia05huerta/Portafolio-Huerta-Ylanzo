package com.portafolio.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class ConexionBD {
    private ConexionBD() {}

    private static final String URL = System.getenv().getOrDefault(
            "PORTAFOLIO_DB_URL",
            "jdbc:mysql://localhost:3306/portafolio_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=America/Lima&characterEncoding=UTF-8"
    );
    private static final String USER =
            System.getProperty(
                    "PORTAFOLIO_DB_USER",
                    System.getenv().getOrDefault("PORTAFOLIO_DB_USER", "root")
            );

    private static final String PASSWORD =
            System.getProperty(
                    "PORTAFOLIO_DB_PASSWORD",
                    System.getenv().getOrDefault("PORTAFOLIO_DB_PASSWORD", "")
            );
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError("No se encontró el driver de MySQL: " + e.getMessage());
        }
    }

    public static Connection getConexion() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
