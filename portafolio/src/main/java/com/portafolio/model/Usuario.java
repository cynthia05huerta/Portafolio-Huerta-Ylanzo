package com.portafolio.model;

public class Usuario {

    private int id;
    private String nombre;
    private String correo;
    private String password;

    private int rolId;
    private String rolNombre;


    public Usuario() {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public int getRolId() {
        return rolId;
    }

    public void setRolId(int rolId) {
        this.rolId = rolId;
    }


    /*
     * Compatibilidad con id_rol
     */
    public int getIdRol() {
        return rolId;
    }

    public void setIdRol(int idRol) {
        this.rolId = idRol;
    }


    public String getRolNombre() {
        return rolNombre;
    }

    public void setRolNombre(String rolNombre) {
        this.rolNombre = rolNombre;
    }


    public boolean isEstudiante() {

        return rolNombre != null
                && rolNombre.equalsIgnoreCase(
                "Estudiante"
        );
    }


    public boolean isProfesor() {

        if (rolNombre == null) {
            return false;
        }

        return rolNombre.equalsIgnoreCase("Profesor")
                || rolNombre.equalsIgnoreCase("Docente");
    }


    public boolean isAdministrador() {

        return rolNombre != null
                && rolNombre.equalsIgnoreCase(
                "Administrador"
        );
    }
}