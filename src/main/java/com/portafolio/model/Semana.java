package com.portafolio.model;

import java.time.LocalDate;

public class Semana {
    private int id;
    private int numero;
    private String titulo;
    private String descripcion;
    private LocalDate fechaInicio;
    private LocalDate fechaFin;
    private boolean estado;
    private int totalTrabajos;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getNumero() { return numero; }
    public void setNumero(int numero) { this.numero = numero; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public LocalDate getFechaInicio() { return fechaInicio; }
    public void setFechaInicio(LocalDate fechaInicio) { this.fechaInicio = fechaInicio; }
    public LocalDate getFechaFin() { return fechaFin; }
    public void setFechaFin(LocalDate fechaFin) { this.fechaFin = fechaFin; }
    public boolean isEstado() { return estado; }
    public void setEstado(boolean estado) { this.estado = estado; }
    public int getTotalTrabajos() { return totalTrabajos; }
    public void setTotalTrabajos(int totalTrabajos) { this.totalTrabajos = totalTrabajos; }
}
