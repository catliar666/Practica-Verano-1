<%@ page import="appcontroller.AppController" %>
<%@ page import="models.Paciente" %><%--
  Created by IntelliJ IDEA.
  User: Maria
  Date: 12/08/2024
  Time: 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    AppController controller = new AppController();

    // Obtén los parámetros de la solicitud
    String namePaciente = request.getParameter("nombrePaciente");
    String nameVacuna = request.getParameter("nombreVacuna");
    String loteVacuna = request.getParameter("loteVacuna");
    String idMedico = request.getParameter("idMedico");
    String dniPaciente = request.getParameter("dniPaciente");

    // Validaciones de campos vacíos o null
    boolean hasErrors = false;

    if (loteVacuna == null || loteVacuna.trim().isEmpty()) {
        session.setAttribute("loteNull", loteVacuna);
        hasErrors = true;
    }

    if (nameVacuna == null || nameVacuna.trim().isEmpty()) {
        session.setAttribute("nameNullVacuna", nameVacuna);
        hasErrors = true;
    }

    if (namePaciente == null || namePaciente.trim().isEmpty()) {
        session.setAttribute("nameNullPaciente", namePaciente);
        hasErrors = true;
    }

    if (idMedico == null || idMedico.trim().isEmpty()) {
        session.setAttribute("medicoNull", idMedico);
        hasErrors = true;
    }

    if (dniPaciente == null || dniPaciente.trim().isEmpty()) {
        session.setAttribute("dniNull", dniPaciente);
        hasErrors = true;
    }

    // Si hubo errores, redirigir a la página de registro correspondiente
    if (hasErrors) {
        response.sendRedirect("registroPacienteNuevo.jsp");
        return;
    }

    // Verifica si el lote de la vacuna ya existe
    try {
        int lote = Integer.parseInt(loteVacuna);
        if (controller.buscaVacuna(lote)) {
            session.setAttribute("loteExist", loteVacuna);
            response.sendRedirect("registroPacienteNuevo.jsp");
            return;
        }
    } catch (NumberFormatException e) {
        response.sendRedirect("error.jsp");
        return;
    }

    // Intenta registrar la vacuna
    try {
        int lote = Integer.parseInt(loteVacuna);
        int idMed = Integer.parseInt(idMedico);
        int dni = Integer.parseInt(dniPaciente);

        if (controller.registraVacuna(nameVacuna, lote, idMed, dni) && controller.insertaPaciente(dni, namePaciente)) {
            session.setAttribute("finish", true);
            response.sendRedirect("sucess.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    } catch (NumberFormatException e) {
        response.sendRedirect("error.jsp");
    }
%>


</body>
</html>
