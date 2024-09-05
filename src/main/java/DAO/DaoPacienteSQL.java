package DAO;

import models.Paciente;
import models.Vacuna;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DaoPacienteSQL implements DaoPaciente{

    /*Este método inserta un paciente nuevo pasandole como parametro un paciente completo, si ha sido insertado correctamente devuelve
    verdadero, ante cualquier fallo devuelve falso
     */
    @Override
    public boolean insert(Paciente paciente, DAOManager dao) {
        String sentencia;
        sentencia = "INSERT INTO Paciente VALUES (" + paciente.getDNI() + ",'" + paciente.getNombreCompleto() + "');";
        try (Statement stmt = dao.getConn().prepareStatement(sentencia)) {
            stmt.executeUpdate(sentencia);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /*Este metodo busca un paciente mediante el dni pasado, si existe el paciente, se traen las vacunas asociadas a ese paciente
    y se crea, una vez creado, se devuelve el paciente completo. Ante cualquier fallo el metodo devolverá null
     */
    @Override
    public Paciente readPaciente(int dni, DAOManager dao) {
        Paciente paciente = null;
        ArrayList<Vacuna> vacunas;
        String sentencia;
        sentencia = "SELECT * from Paciente WHERE dni = ?";
        try (PreparedStatement ps = dao.getConn().prepareStatement(sentencia)) {
            ps.setInt(1, dni);
            try (ResultSet rs = ps.executeQuery()) {
                DaoVacunaSQL daoVacunaSQL = new DaoVacunaSQL();
                vacunas = daoVacunaSQL.readVacunaByDniPaciente(dni, dao);
                while (rs.next()) {
                    paciente = new Paciente(rs.getInt("dni"), rs.getString("nombreCompleto"), vacunas);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return paciente;
    }
}
