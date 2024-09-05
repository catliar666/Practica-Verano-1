package models;

import utils.Utils;

import java.time.LocalDate;

public class Vacuna {
    private String nombre;
    private int lote;
    private int idMedico;
    private LocalDate fechaInoculacion;

    public Vacuna(String nombre, int lote, LocalDate fechaInoculacion, int idMedico) {
        this.nombre = nombre;
        this.lote = lote;
        this.fechaInoculacion = fechaInoculacion;
        this.idMedico = idMedico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getLote() {
        return lote;
    }

    public void setLote(int lote) {
        this.lote = lote;
    }

    public LocalDate getFechaInoculacion() {
        return fechaInoculacion;
    }

    public void setFechaInoculacion(LocalDate fechaInoculacion) {
        this.fechaInoculacion = fechaInoculacion;
    }

    public int getIdMedico() {
        return idMedico;
    }

    public void setIdMedico(int idMedico) {
        this.idMedico = idMedico;
    }

    @Override
    public String toString() {
        return "Nombre de la vacuna: " + nombre + "\n" +
               "Número de lote: " + lote + "\n" +
               "Fecha de la inoculación: " + Utils.fechaAString(fechaInoculacion);
    }
}
