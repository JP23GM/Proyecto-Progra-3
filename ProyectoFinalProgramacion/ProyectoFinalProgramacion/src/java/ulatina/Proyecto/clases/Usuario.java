/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulatina.Proyecto.clases;

/**
 *
 * @author Julian
 */
public class Usuario {
    private String cedula;
    private String nombre;
    private String genero;
    private String antiguedad;
    private String perfil;
    private String contrasena;
    private String salario;

    public Usuario(String cedula, String nombre, String genero, String antiguedad, String perfil, String contrasena, String salario) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.genero = genero;
        this.antiguedad = antiguedad;
        this.perfil = perfil;
        this.contrasena = contrasena;
        this.salario = salario;
    }

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(String antiguedad) {
        this.antiguedad = antiguedad;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Usuario{");
        sb.append("cedula=").append(cedula);
        sb.append(", nombre=").append(nombre);
        sb.append(", genero=").append(genero);
        sb.append(", antiguedad=").append(antiguedad);
        sb.append(", perfil=").append(perfil);
        sb.append(", contrasena=").append(contrasena);
        sb.append(", salario=").append(salario);
        sb.append('}');
        return sb.toString();
    }
    
    
            
}
