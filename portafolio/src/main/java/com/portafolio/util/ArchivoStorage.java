package com.portafolio.util;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

public final class ArchivoStorage {
    private ArchivoStorage() {}

    private static final Set<String> EXT_PERMITIDAS = Set.of(
            "pdf", "doc", "docx", "ppt", "pptx", "xls", "xlsx",
            "zip", "rar", "png", "jpg", "jpeg", "webp", "txt", "java", "html", "css", "js"
    );

    private static final long MAX = 20L * 1024 * 1024; // 20 MB

    private static final Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", System.getenv().getOrDefault("CLOUDINARY_CLOUD_NAME", ""),
            "api_key", System.getenv().getOrDefault("CLOUDINARY_API_KEY", ""),
            "api_secret", System.getenv().getOrDefault("CLOUDINARY_API_SECRET", ""),
            "secure", true
    ));

    public static Guardado guardar(Part part, int semanaNumero) throws IOException {
        if (part == null || part.getSize() == 0) {
            throw new IllegalArgumentException("Selecciona un archivo.");
        }
        if (part.getSize() > MAX) {
            throw new IllegalArgumentException("El archivo supera el límite de 20 MB.");
        }

        String original = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String ext = extension(original);
        if (!EXT_PERMITIDAS.contains(ext)) {
            throw new IllegalArgumentException("Tipo de archivo no permitido: ." + ext);
        }

        Map uploadResult;
        try (InputStream in = part.getInputStream()) {
            byte[] fileBytes = in.readAllBytes();
            uploadResult = cloudinary.uploader().upload(fileBytes, ObjectUtils.asMap(
                    "resource_type", "auto",
                    "folder", "portafolio/semana-" + semanaNumero
            ));
        }

        String secureUrl = (String) uploadResult.get("secure_url");
        String publicId = (String) uploadResult.get("public_id");

        return new Guardado(original, publicId, secureUrl, part.getContentType(), ext, part.getSize());
    }

    private static String extension(String nombre) {
        int i = nombre.lastIndexOf('.');
        return i < 0 ? "" : nombre.substring(i + 1).toLowerCase(Locale.ROOT);
    }

    public record Guardado(String original, String servidor, String ruta, String tipo, String extension, long tamano) {}
}