package com.portafolio.util;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

public final class ArchivoStorage {
    private ArchivoStorage() {}
    private static final Set<String> EXT_PERMITIDAS = Set.of("pdf", "doc", "docx", "ppt", "pptx", "xls", "xlsx", "zip", "rar", "png", "jpg", "jpeg", "webp", "txt", "java", "html", "css", "js");
    private static final long MAX = 20L * 1024 * 1024;

    public static Path directorioBase() throws IOException {
        String configurado = System.getProperty("portafolio.upload.dir");
        if (configurado == null || configurado.isBlank()) configurado = System.getenv("PORTAFOLIO_UPLOAD_DIR");
        if (configurado == null || configurado.isBlank()) configurado = Paths.get(System.getProperty("user.home"), "portafolio-uploads").toString();
        Path base = Paths.get(configurado).toAbsolutePath().normalize();
        Files.createDirectories(base);
        return base;
    }

    public static Guardado guardar(Part part, int semanaNumero) throws IOException {
        if (part == null || part.getSize() == 0) throw new IllegalArgumentException("Selecciona un archivo.");
        if (part.getSize() > MAX) throw new IllegalArgumentException("El archivo supera el límite de 20 MB.");
        String original = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String ext = extension(original);
        if (!EXT_PERMITIDAS.contains(ext)) throw new IllegalArgumentException("Tipo de archivo no permitido: ." + ext);
        String servidor = UUID.randomUUID() + (ext.isBlank() ? "" : "." + ext);
        Path carpeta = directorioBase().resolve("semana-" + semanaNumero).normalize();
        Files.createDirectories(carpeta);
        Path destino = carpeta.resolve(servidor).normalize();
        if (!destino.startsWith(directorioBase())) throw new SecurityException("Ruta de archivo no válida.");
        try (InputStream in = part.getInputStream()) { Files.copy(in, destino, StandardCopyOption.REPLACE_EXISTING); }
        String relativa = directorioBase().relativize(destino).toString().replace('\\', '/');
        return new Guardado(original, servidor, relativa, part.getContentType(), ext, part.getSize());
    }

    public static Path resolver(String rutaRelativa) throws IOException {
        Path base = directorioBase();
        Path archivo = base.resolve(rutaRelativa).normalize();
        if (!archivo.startsWith(base)) throw new SecurityException("Ruta no válida.");
        return archivo;
    }

    private static String extension(String nombre) {
        int i = nombre.lastIndexOf('.');
        return i < 0 ? "" : nombre.substring(i + 1).toLowerCase(Locale.ROOT);
    }

    public record Guardado(String original, String servidor, String ruta, String tipo, String extension, long tamano) {}
}
