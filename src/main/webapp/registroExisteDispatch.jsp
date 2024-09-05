<%@ page import="appcontroller.AppController" %>
<%@ page import="models.Paciente" %><%--
  Created by IntelliJ IDEA.
  User: Maria
  Date: 15/08/2024
  Time: 18:10
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
    Paciente paciente = (Paciente) session.getAttribute("findPaciente");

    String nameVacuna = request.getParameter("nombreVacuna");
    String loteVacunaParam = request.getParameter("loteVacuna");
    String idMedicoParam = request.getParameter("idMedico");

    Integer loteVacuna = null;
    Integer idMedico = null;

    boolean hasErrors = false;

    // Validar y convertir loteVacuna
    if (loteVacunaParam == null || loteVacunaParam.trim().isEmpty()) {
        session.setAttribute("loteNull", loteVacunaParam);
        hasErrors = true;
    } else {
        try {
            loteVacuna = Integer.parseInt(loteVacunaParam);
        } catch (NumberFormatException e) {
            session.setAttribute("loteInvalid", loteVacuna);
            hasErrors = true;
        }
    }

    // Validar y convertir idMedico
    if (idMedicoParam == null || idMedicoParam.trim().isEmpty()) {
        session.setAttribute("medicoNull", idMedicoParam);
        hasErrors = true;
    } else {
        try {
            idMedico = Integer.parseInt(idMedicoParam);
        } catch (NumberFormatException e) {
            session.setAttribute("medicoInvalid", idMedico);
            hasErrors = true;
        }
    }

    // Verificar otros campos
    if (nameVacuna == null || nameVacuna.trim().isEmpty()) {
        session.setAttribute("nameNullVacuna", nameVacuna);
        hasErrors = true;
    }

    if (hasErrors) {
        response.sendRedirect("registroPacienteExiste.jsp");
        return;
    }

    // Validar si el lote ya existe
    if (controller.buscaVacuna(loteVacuna)) {
        session.setAttribute("loteExist", loteVacunaParam);
        response.sendRedirect("registroPacienteExiste.jsp");
        return;
    }

    // Registrar la vacuna si todo es válido
    if (controller.registraVacuna(nameVacuna, loteVacuna, idMedico, paciente.getDNI())) {
        session.setAttribute("finish", true);
        response.sendRedirect("sucess.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>

</body>
</html>
