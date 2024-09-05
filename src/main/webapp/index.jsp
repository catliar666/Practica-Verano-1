<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/style.css" rel="stylesheet">
    <title>Covid-Fernand</title>
</head>
<body>
<header class="header">
    <nav class="nav">
        <a href="index.jsp" class="nav_logo"><span>C</span>ovid<span>F</span>ernand<span>+</span></a>
    </nav>
</header>
<!--Opcion del enfermero para meter en registro un paciente y la vacuna inoculada-->
<section class="section_container sobreNosotros">
    <div class="sobreNosotros_header">
        <a href="indexEnfermero.jsp" class="sobreNosotros_link">
            <div class="sobreNosotros_card">
                <img src="img/vacunacion.png" alt="Imagen_vacunación">
                <h4>Vacunación</h4>
                <p>Introducción de información sobre una inoculación nueva sobre el paciente.</p>
            </div>
        </a>
        <a href="indexPaciente.jsp" class="sobreNosotros_link">
            <div class="sobreNosotros_card">
                <img src="img/informacion.png" alt="Imagen_información">
                <h4>Información del paciente</h4>
                <p>Se muestra toda la informacion de las vacunas inoculadas al paciente, fecha de inoculación y
                si obtiene o no el certificado Covid.</p>
            </div>
        </a>
    </div>

</section>


<footer class="footer">
    <div class="container-footer">
        <p>&copy; 2024 CovidFernand+. Todos los derechos reservados.</p>
    </div>
</footer>



</body>
</html>