package appcontroller;

import DAO.*;
import models.Paciente;
import models.Vacuna;

import java.time.LocalDate;

public class AppController {
    private DAOManager dao;

    public AppController() {
        dao = DAOManager.getSinglentonInstance();
    }


    public Paciente buscaPaciente(int dni) {
        Paciente paciente = null;
        try {
            dao.open();
            DaoPacienteSQL daoPacienteSQL = new DaoPacienteSQL();
            paciente = daoPacienteSQL.readPaciente(dni, dao);
            dao.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return paciente;
    }

    public boolean registraVacuna(String nombre, int lote, int idMedico, int idPaciente) {
        try {
            dao.open();
            DaoVacunaSQL daoVacunaSQL = new DaoVacunaSQL();
            Vacuna vacuna = new Vacuna(nombre, lote, LocalDate.now(), idMedico);
            boolean insertado = daoVacunaSQL.insert(vacuna, idPaciente, dao);
            dao.close();
            return insertado;
        } catch (Exception e) {
            return false;
        }

    }
    public boolean insertaPaciente(int dni, String nombreCompleto) {
        try {
            dao.open();
            DaoPacienteSQL daoPacienteSQL = new DaoPacienteSQL();
            Paciente paciente = new Paciente(dni, nombreCompleto, null);
            boolean insertado = daoPacienteSQL.insert(paciente, dao);
            dao.close();
            return insertado;
        } catch (Exception e) {
            return false;
        }

    }

    /*Este metodo abre la base de datos y busca en ella si la vacuna con el lote pasado como parametro existe, si existe
    devuelve verdadero, pero si no existe devuelve falso
    Ante cualquier fallo pinta el error en pantalla
     */

    public boolean buscaVacuna(int lote) {
        try {
            dao.open();
            DaoVacunaSQL daoVacunaSQL = new DaoVacunaSQL();
            Vacuna vacuna = daoVacunaSQL.readVacunaByLote(lote, dao);
            dao.close();
            if (vacuna == null) return false;
            else return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;

    }
}
