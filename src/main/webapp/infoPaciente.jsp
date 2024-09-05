<%@ page import="models.Paciente" %><%--
  Created by IntelliJ IDEA.
  User: Maria
  Date: 09/08/2024
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/styleInfoPaciente.css" rel="stylesheet">

    <title>Title</title>
</head>
<body>
<%
    Paciente paciente = (Paciente) session.getAttribute("findPaciente");

    if (paciente == null) {
        session.removeAttribute("findPaciente");
        response.sendRedirect("indexPaciente.html");
    } else {
%>
<header class="header">
    <nav class="nav">
        <a href="index.jsp" class="nav_logo"><span>C</span>ovid<span>F</span>ernand<span>+</span></a>
        <a class="nav_welcome">Bienvenido <%= paciente.getNombreCompleto()%></a>
    </nav>
</header>

<div class="certification">
<%
    int numVacunas = paciente.numVacunas();
    if (numVacunas >= 2) {

%>
    <div class="certification-item">
        <p> Usted obtiene el certificado Covid-19</p>
    </div>
<%
    } else {

%>
    <div class="certification-item">
        <p>Le faltan <%= 2 - numVacunas %> vacunas para obtener su certificado</p>
    </div>
<%
    }
%>
</div>

<div class="vacunas-container">
<%= paciente.mostrarVacunas() %>
</div>

<footer class="footer">
    <div class="container-footer">
        <p>&copy; 2024 CovidFernand+. Todos los derechos reservados.</p>
    </div>
</footer>
<%
    }
%>
</body>
</html>
