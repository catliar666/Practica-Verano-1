package DAO;

import models.Paciente;

public interface DaoPaciente {
    boolean insert(Paciente paciente, DAOManager dao);
    Paciente readPaciente (int dni, DAOManager dao);
}
