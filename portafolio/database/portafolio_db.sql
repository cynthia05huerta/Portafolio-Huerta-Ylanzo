CREATE DATABASE IF NOT EXISTS portafolio_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE portafolio_db;

CREATE TABLE IF NOT EXISTS roles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL UNIQUE
);
INSERT IGNORE INTO roles(id,nombre) VALUES (1,'ADMIN'),(2,'USUARIO');

CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL DEFAULT '',
  correo VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  rol_id INT NOT NULL DEFAULT 2,
  estado TINYINT(1) NOT NULL DEFAULT 1,
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES roles(id)
);

CREATE TABLE IF NOT EXISTS semanas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero INT NOT NULL UNIQUE,
  titulo VARCHAR(200) NOT NULL,
  descripcion TEXT,
  fecha_inicio DATE,
  fecha_fin DATE,
  estado TINYINT(1) DEFAULT 1,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trabajos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  semana_id INT NOT NULL,
  titulo VARCHAR(200) NOT NULL,
  descripcion TEXT,
  contenido TEXT,
  fecha_entrega DATE,
  estado ENUM('PENDIENTE','EN_PROCESO','COMPLETADO') DEFAULT 'PENDIENTE',
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_trabajo_semana FOREIGN KEY (semana_id) REFERENCES semanas(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS archivos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  trabajo_id INT NOT NULL,
  nombre_original VARCHAR(255) NOT NULL,
  nombre_servidor VARCHAR(255) NOT NULL,
  ruta VARCHAR(500) NOT NULL,
  tipo VARCHAR(100),
  extension VARCHAR(20),
  tamano BIGINT,
  fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_archivo_trabajo FOREIGN KEY (trabajo_id) REFERENCES trabajos(id) ON DELETE CASCADE
);

INSERT IGNORE INTO semanas(numero,titulo,descripcion) VALUES
(1,'Fundamentos e introducción','Primeros conceptos, actividades y evidencias del curso.'),
(2,'Desarrollo web','Prácticas y ejercicios relacionados con aplicaciones web.'),
(3,'Persistencia de datos','Actividades de bases de datos, JDBC y modelado relacional.');

-- IMPORTANTE:
-- Registra tu cuenta desde /registro y luego conviértela en administradora con:
-- UPDATE usuarios SET rol_id = 1 WHERE correo = 'TU_CORREO';
