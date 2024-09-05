package DAO;

import models.Vacuna;

import java.util.ArrayList;

public interface DaoVacuna {
    boolean insert(Vacuna vacuna, int dniPaciente, DAOManager dao);
    ArrayList<Vacuna> readVacunaByDniPaciente(int dni, DAOManager dao);

    Vacuna readVacunaByLote(int lote, DAOManager dao);
}
