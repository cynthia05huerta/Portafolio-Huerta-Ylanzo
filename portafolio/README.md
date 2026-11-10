# Portafolio Personal — Java Web

Proyecto académico desarrollado con Java 21, JSP, Servlets (Jakarta Servlet 6.1), Apache Tomcat 11, Maven y MySQL.

## 1. Base de datos
Ejecuta `database/portafolio_db.sql` en MySQL Workbench.

## 2. Credenciales de MySQL
Por defecto el proyecto intenta conectarse con:
- Base: `portafolio_db`
- Usuario: `root`
- Contraseña: `admin123`

Lo recomendable es definir variables de entorno:
- `PORTAFOLIO_DB_URL`
- `PORTAFOLIO_DB_USER`
- `PORTAFOLIO_DB_PASSWORD`

## 3. Carpeta de archivos
Los documentos NO se almacenan dentro del proyecto. Si no configuras nada se guardan en:
`<tu usuario>/portafolio-uploads/semana-N/`

Puedes cambiarla con la variable de entorno `PORTAFOLIO_UPLOAD_DIR` o con la propiedad JVM:
`-Dportafolio.upload.dir=C:\PortafolioServidor`

## 4. Administradora
1. Entra a `/registro` y crea tu cuenta.
2. En MySQL Workbench ejecuta:
   `UPDATE usuarios SET rol_id=1 WHERE correo='tu_correo';`
3. Cierra sesión y vuelve a entrar.
4. En `Semanas` aparecerán los paneles para crear semanas y publicar trabajos/archivos.

## 5. Ejecutar en IntelliJ + Tomcat 11
- Project SDK: JDK 21.
- Maven: recarga `pom.xml`.
- Configura Apache Tomcat 11.
- Deployment: artifact `portafolio:war exploded`.
- Context path recomendado: `/portafolio`.
- Abre `http://localhost:8080/portafolio/`.

## Archivos permitidos
PDF, DOC/DOCX, PPT/PPTX, XLS/XLSX, ZIP/RAR, PNG/JPG/JPEG/WEBP, TXT, JAVA, HTML, CSS y JS. Máximo 20 MB por archivo.
