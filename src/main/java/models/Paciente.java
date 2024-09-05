package models;

import jdk.jshell.execution.Util;
import utils.Utils;

import java.time.LocalDate;
import java.util.ArrayList;

public class Paciente {
    private int dni;
    private String nombreCompleto;
    private ArrayList<Vacuna> vacunas;

    public Paciente(int DNI, String nombreCompleto, ArrayList<Vacuna> vacunas) {
        this.dni = DNI;
        this.nombreCompleto = nombreCompleto;
        this.vacunas = vacunas;
    }

    public int getDNI() {
        return dni;
    }

    public void setDNI(int DNI) {
        this.dni = DNI;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public ArrayList<Vacuna> getVacunas() {
        return vacunas;
    }

    public void setVacunas(ArrayList<Vacuna> vacunas) {
        this.vacunas = vacunas;
    }

    public String mostrarVacunas() {
        StringBuilder resultado = new StringBuilder();
        if (vacunas.isEmpty()) {
            return "<div class='no-vacunas'><p>No tiene vacunas administradas</p></div>";
        } else {
            resultado.append("<ul class='vacunas-lista'>");
            for (Vacuna v : vacunas) {
                if (v != null) {
                    String fecha = Utils.fechaAString(v.getFechaInoculacion());
                    resultado.append("<li class='vacuna-item'>")
                            .append("<div class='vacuna-info'>")

                            // Fila de títulos
                            .append("<div class='vacuna-titulos'>")
                            .append("<span class='vacuna-label'>Nombre de la inoculación</span>")
                            .append("<span class='vacuna-label'>Número de lote</span>")
                            .append("<span class='vacuna-label'>Fecha de inoculación</span>")
                            .append("</div>")

                            // Fila de detalles
                            .append("<div class='vacuna-detalles'>")
                            .append("<span class='vacuna-detail'>").append(v.getNombre()).append("</span>")
                            .append("<span class='vacuna-detail'>").append(v.getLote()).append("</span>")
                            .append("<span class='vacuna-detail'>").append(fecha).append("</span>")
                            .append("</div>")

                            .append("</div>") // Cierre de vacuna-info
                            .append("</li>"); // Cierre de vacuna-item
                }
            }
            resultado.append("</ul>");
        }
        return resultado.toString();
    }




    public int numVacunas() {
        return vacunas.size();
    }
}
