<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<header class="topbar">
    <div class="shell nav-wrap">

        <!-- MARCA -->
        <a class="brand"
           href="${pageContext.request.contextPath}/inicio">

            <strong>Abigail.</strong>
            <span>Portafolio Académico</span>

        </a>

        <!-- MENÚ -->
        <nav class="main-nav">

            <a href="${pageContext.request.contextPath}/inicio">
                Inicio
            </a>

            <a href="${pageContext.request.contextPath}/inicio#sobre-mi">
                Sobre mí
            </a>

            <a href="${pageContext.request.contextPath}/inicio#habilidades">
                Habilidades
            </a>

            <a href="${pageContext.request.contextPath}/inicio#proyectos">
                Proyectos
            </a>

            <a href="${pageContext.request.contextPath}/semanas">
                Semanas
            </a>

            <a href="${pageContext.request.contextPath}/inicio#contacto">
                Contacto
            </a>

        </nav>

        <!-- LOGIN -->
        <a class="login-btn"
           href="${pageContext.request.contextPath}/login">
            Ingresar
        </a>

    </div>
</header>