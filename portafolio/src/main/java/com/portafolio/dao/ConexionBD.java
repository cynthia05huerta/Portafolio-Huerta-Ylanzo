package com.portafolio.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class ConexionBD {
    private ConexionBD() {}

    private static final String URL = System.getenv().getOrDefault(
            "PORTAFOLIO_DB_URL",
            "jdbc:mysql://mysql-2051fa03-cynthia05huerta-5b48.j.aivencloud.com:18437/defaultdb?useSSL=true&requireSSL=true&serverTimezone=UTC"
    );

    private static final String USER = System.getenv().getOrDefault(
            "PORTAFOLIO_DB_USER",
            "avnadmin"
    );

    // Dejar comillas vacias para evitar bloqueos de seguridad en GitHub
    private static final String PASSWORD = System.getenv().getOrDefault(
            "PORTAFOLIO_DB_PASSWORD",
            ""
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