/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulatina.Proyecto.clases;

/**
 *
 * @author Julian
 */
public class Cliente {
    private String cedula;
    private String nombre;
    private String tipo;
    private String pago;
    private String tarjeta;
    private String numero;

    public Cliente(String cedula, String nombre, String tipo, String pago, String tarjeta, String numero) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.tipo = tipo;
        this.pago = pago;
        this.tarjeta = tarjeta;
        this.numero = numero;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }

    public String getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Cliente{");
        sb.append("cedula=").append(cedula);
        sb.append(", nombre=").append(nombre);
        sb.append(", tipo=").append(tipo);
        sb.append(", pago=").append(pago);
        sb.append(", tarjeta=").append(tarjeta);
        sb.append(", numero=").append(numero);
        sb.append('}');
        return sb.toString();
    }
    
    
}
