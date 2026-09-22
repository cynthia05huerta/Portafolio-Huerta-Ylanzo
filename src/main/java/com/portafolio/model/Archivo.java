package com.portafolio.model;

public class Archivo {

    private int id;
    private int trabajoId;

    private String nombreArchivo;
    private String rutaArchivo;


    public Archivo() {
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public int getTrabajoId() {
        return trabajoId;
    }


    public void setTrabajoId(int trabajoId) {
        this.trabajoId = trabajoId;
    }


    public String getNombreArchivo() {
        return nombreArchivo;
    }


    public void setNombreArchivo(String nombreArchivo) {
        this.nombreArchivo = nombreArchivo;
    }


    public String getRutaArchivo() {
        return rutaArchivo;
    }


    public void setRutaArchivo(String rutaArchivo) {
        this.rutaArchivo = rutaArchivo;
    }


    /*
     * Compatibilidad con código anterior
     */

    public String getNombreOriginal() {
        return nombreArchivo;
    }


    public void setNombreOriginal(String nombreOriginal) {
        this.nombreArchivo = nombreOriginal;
    }


    public String getRuta() {
        return rutaArchivo;
    }


    public void setRuta(String ruta) {
        this.rutaArchivo = ruta;
    }
}