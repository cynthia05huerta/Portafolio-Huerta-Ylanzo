package com.portafolio.model;

import java.time.LocalDateTime;

public class Comentario {

    private int id;

    private String contenido;

    private LocalDateTime fechaComentario;

    private int trabajoId;
    private int usuarioId;

    private Double nota;

    private String tituloTrabajo;
    private int numeroSemana;


    public Comentario() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }


    public LocalDateTime getFechaComentario() {
        return fechaComentario;
    }

    public void setFechaComentario(
            LocalDateTime fechaComentario
    ) {
        this.fechaComentario =
                fechaComentario;
    }


    public int getTrabajoId() {
        return trabajoId;
    }

    public void setTrabajoId(int trabajoId) {
        this.trabajoId = trabajoId;
    }


    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }


    public Double getNota() {
        return nota;
    }

    public void setNota(Double nota) {
        this.nota = nota;
    }


    public String getTituloTrabajo() {
        return tituloTrabajo;
    }

    public void setTituloTrabajo(
            String tituloTrabajo
    ) {
        this.tituloTrabajo =
                tituloTrabajo;
    }


    public int getNumeroSemana() {
        return numeroSemana;
    }

    public void setNumeroSemana(
            int numeroSemana
    ) {
        this.numeroSemana =
                numeroSemana;
    }
}