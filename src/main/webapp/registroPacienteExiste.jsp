<%@ page import="utils.Utils" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="models.Paciente" %><%--
  Created by IntelliJ IDEA.
  User: Maria
  Date: 12/08/2024
  Time: 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/styleRegistro.css" rel="stylesheet">
    <title>Registro de vacunación</title>
</head>
<body>
<%
    Paciente paciente = (Paciente) session.getAttribute("findPaciente");
    String fechaActual = Utils.fechaAString(LocalDate.now());

    if (paciente == null) {
        response.sendRedirect("error.jsp");
    } else {

%>
<header class="header">
    <nav class="nav">
        <a href="index.jsp" class="nav_logo"><span>C</span>ovid<span>F</span>ernand<span>+</span></a>
        <a class="nav_welcome">Vacunación a fecha <%=fechaActual%></a>
    </nav>
</header>

<div class="form-container">
    <h3>Regístro de Vacunación a <%=paciente.getNombreCompleto()%></h3>
    <hr>
    <br>
    <form method="post" action="registroExisteDispatch.jsp">
        <div class="input-box">
            <%
                String nameNullVacuna = (String) session.getAttribute("nameNullVacuna");

                if (nameNullVacuna != null) {
                    session.removeAttribute("nameNullVacuna");
            %>
            <p class="fails">Debe introducir el nombre de la vacuna administrada</p>
            <%
                }
            %>
            <label>Nombre de la vacuna</label>
            <input type="text" name="nombreVacuna" id="nameVacuna" placeholder="Introduce el nombre de la vacuna" pattern="^[^<>]*$">
        </div>
        <div class="input-box">
            <%
                String exist = (String) session.getAttribute("loteExist");
                String loteNull = (String) session.getAttribute("loteNull");

                if (exist != null) {
                    session.removeAttribute("loteExist");
            %>
            <p class="fails">El lote introducido ya ha sido inoculado, introduzca otro distinto</p>
            <%
                }
            %>

            <%
                if (loteNull != null) {
                    session.removeAttribute("loteNull");
            %>
            <p class="fails">Debe introducir el lote de la vacuna administrada</p>
            <%
                }
            %>
            <label>Lote de la vacuna</label>
            <input type="number" name="loteVacuna" id="loteVacuna" placeholder="Introduce el lote de la vacuna" pattern="^[^<>]*$">
        </div>

        <div class="input-box">
            <%
                String medicoNull = (String) session.getAttribute("medicoNull");

                if (medicoNull != null) {
                    session.removeAttribute("medicoNull");
            %>
            <p class="fails">Debe introducir el identificador del médico</p>
            <%
                }
            %>
            <label>Identificación del médico</label>
            <input type="number" name="idMedico" id="idMedico" placeholder="Introduce identificación del médico" pattern="^[^<>]*$">
        </div>

        <div class="input-box">
            <button class="input-submit">
                <span>Enviar</span>
            </button>
        </div>
    </form>
</div>

<!--Comienzo del pie-->
<footer class="footer">
    <div class="container-footer">
        <p>&copy; 2024 CovidFernand+. Todos los derechos reservados.</p>
    </div>
</footer>
<!--Fin del pie-->

<%
    }
%>
</body>
</html>
