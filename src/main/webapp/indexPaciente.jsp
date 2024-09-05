<%--
  Created by IntelliJ IDEA.
  User: Maria
  Date: 08/08/2024
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/styleIndexs.css" rel="stylesheet">
    <title>Información Paciente</title>
</head>
<body>

<header class="header">
    <nav class="nav">
        <a href="index.jsp" class="nav_logo"><span>C</span>ovid<span>F</span>ernand<span>+</span></a>
    </nav>
</header>

<div class="form-container">
        <!--CONTENEDOR DEL FORMULARIO INICIO SESIÓN-->
        <form action="pacienteDispatch.jsp" method="post">
            <div class="login-form">
                <div class="form-title">
                    <p>Buscar <span>información</span></p>
                </div>
                <div class="form-inputs">
                    <%
                        String dniNull = (String) session.getAttribute("dniNull");
                        if (dniNull != null) {
                            session.removeAttribute("dniNull");
                    %>
                    <span class="fails"> Debes introducir un DNI</span>
                    <%
                        }
                    %>
                    <%
                        String dniNoExit = (String) session.getAttribute("dniNotExist");
                        if (dniNoExit != null) {
                            session.removeAttribute("dniNotExist");
                    %>
                    <span class="fails">El dni introducido no existe</span>
                    <%
                        }
                    %>
                    <div class="input-box">
                        <input type="number" name="dniText" class="input-field" placeholder="Introduce tu dni">
                    </div>

                    <div class="input-box">
                        <button class="input-submit">
                            <span>Comprobar</span>
                        </button>
                    </div>

                </div>
            </div>
        </form>
    </div>


<footer class="footer">
    <div class="container-footer">
        <p>&copy; 2024 CovidFernand+. Todos los derechos reservados.</p>
    </div>
</footer>


</body>
</html>
