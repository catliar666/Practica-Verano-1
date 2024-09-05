<%@ page import="appcontroller.AppController" %>
<%@ page import="models.Paciente" %><%--
  Created by IntelliJ IDEA.
  User: Maria
  Date: 12/08/2024
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String dni = request.getParameter("dniText");
    AppController controller = new AppController();

    if (dni.isEmpty()) {
        session.setAttribute("dniNull", dni);
        response.sendRedirect("indexEnfermero.jsp");
        return;
    }

    Paciente paciente = controller.buscaPaciente(Integer.parseInt(dni));
    if (paciente == null) {
        session.setAttribute("dniNotExist", dni);
        response.sendRedirect("registroPacienteNuevo.jsp");
        return;
    } else {
        session.setAttribute("findPaciente", paciente);
        response.sendRedirect("registroPacienteExiste.jsp");
    }
%>
</body>
</html>
