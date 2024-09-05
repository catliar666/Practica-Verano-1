package DAO;

import models.Vacuna;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoVacunaSQL implements DaoVacuna{

    /*Este método inserta una vacuna nueva, devuelve verdadero si ha sido insertada correctamente, sino devuelve falso ante
    cualquier fallo
     */
    @Override
    public boolean insert(Vacuna vacuna, int dniPaciente, DAOManager dao) {
        String sentencia;
        sentencia = "INSERT INTO Vacuna VALUES ('" + vacuna.getNombre() + "'," + vacuna.getLote() + ",'" + vacuna.getFechaInoculacion() + "'," +
                    dniPaciente + "," + vacuna.getIdMedico() + ");";
        try (Statement stmt = dao.getConn().prepareStatement(sentencia)) {
            stmt.executeUpdate(sentencia);
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    /*
    Este método busca si existe la vacuna asociada al dni del paciente introducido, si existe devuelve un array de todas las vacunas
    que están asociadas a ese dni del paciente sino, devuelve el array vacio
     */
    @Override
    public ArrayList<Vacuna> readVacunaByDniPaciente(int dni, DAOManager dao) {
        ArrayList<Vacuna> vacunas = new ArrayList<>();
        String sentencia;
        sentencia = "SELECT * FROM Vacuna WHERE dniPaciente = ?";
        try (PreparedStatement ps = dao.getConn().prepareStatement(sentencia)){
            ps.setInt(1, dni);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    vacunas.add(new Vacuna(rs.getString("nombre"),
                            rs.getInt("lote"), rs.getDate("fechaInolucacion").toLocalDate(), rs.getInt("idMedico")));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vacunas;
    }

    /*
    Este método busca si existe la vacuna con el numero el lote introducido, si existe devuelve la vacuna completa
    sino devuelve null
     */

    @Override
    public Vacuna readVacunaByLote(int lote, DAOManager dao) {
        Vacuna vacuna = null;
        String sentencia;
        sentencia = "SELECT * FROM Vacuna WHERE lote = ?";
        try (PreparedStatement ps = dao.getConn().prepareStatement(sentencia)){
            ps.setInt(1, lote);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    vacuna = new Vacuna(rs.getString("nombre"),
                            rs.getInt("lote"), rs.getDate("fechaInolucacion").toLocalDate(), rs.getInt("idMedico"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vacuna;
    }
}
