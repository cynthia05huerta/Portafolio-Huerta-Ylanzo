package com.portafolio.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


public class Trabajo {

    private int id;

    private int usuarioId;
    private int semanaId;

    private String titulo;
    private String descripcion;
    private String enlaceExterno;

    private LocalDateTime fechaEntrega;

    private final List<Archivo> archivos =
            new ArrayList<>();


    public Trabajo() {
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public int getUsuarioId() {
        return usuarioId;
    }


    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }


    public int getSemanaId() {
        return semanaId;
    }


    public void setSemanaId(int semanaId) {
        this.semanaId = semanaId;
    }


    public String getTitulo() {
        return titulo;
    }


    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }


    public String getDescripcion() {
        return descripcion;
    }


    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


    public String getEnlaceExterno() {
        return enlaceExterno;
    }


    public void setEnlaceExterno(String enlaceExterno) {
        this.enlaceExterno = enlaceExterno;
    }


    public LocalDateTime getFechaEntrega() {
        return fechaEntrega;
    }


    public void setFechaEntrega(LocalDateTime fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }


    public List<Archivo> getArchivos() {
        return archivos;
    }
}