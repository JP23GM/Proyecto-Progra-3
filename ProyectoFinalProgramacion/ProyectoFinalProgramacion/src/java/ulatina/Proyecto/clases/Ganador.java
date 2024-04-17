/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulatina.Proyecto.clases;

/**
 *
 * @author Julian
 */
public class Ganador {

    private String cedula;
    private String juego;
    private String monto;

    public Ganador(String cedula, String juego, String monto) {
        this.cedula = cedula;
        this.juego = juego;
        this.monto = monto;
    }

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getJuego() {
        return juego;
    }

    public void setJuego(String juego) {
        this.juego = juego;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Ganador{");
        sb.append("juego=").append(juego);
        sb.append(", cedula=").append(cedula);
        sb.append(", monto=").append(monto);
        sb.append('}');
        return sb.toString();
    }

}
