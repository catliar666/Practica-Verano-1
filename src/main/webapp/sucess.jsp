<%--
  Created by IntelliJ IDEA.
  User: Maria
  Date: 15/08/2024
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/styleSucess.css" rel="stylesheet">
    <title>Success</title>
</head>
<body>
<%
    Boolean finish = (Boolean) session.getAttribute("finish");

    if (finish != null && finish) {
        session.removeAttribute("finish");
%>
<header class="header">
    <nav class="nav">
        <a href="index.jsp" class="nav_logo"><span>C</span>ovid<span>F</span>ernand<span>+</span></a>
    </nav>
</header>

<div class="form-container">
    <!--CONTENEDOR DEL FORMULARIO INICIO SESIÓN-->
    <p>Acción realizada correctamente</p>
    <p>Para volver a la página de inicio <a href="index.jsp">pulse aquí</a></p>
</div>

<!--Comienzo del pie-->
<footer class="footer">
    <div class="container-footer">
        <p>&copy; 2024 CovidFernand+. Todos los derechos reservados.</p>
    </div>
</footer>
<!--Fin del pie-->
<%
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
