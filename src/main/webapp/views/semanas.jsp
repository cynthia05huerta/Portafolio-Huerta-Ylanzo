<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Semanas | Portafolio Académico 2026"
    );
%>

<%@ include file="fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/semanas.css">


<div class="weeks26-page">

    <!-- =====================================================
         HEADER
         ===================================================== -->
    <header class="weeks26-header">

        <div class="weeks26-container weeks26-nav">

            <!-- LOGO + NOMBRE -->
            <a href="${pageContext.request.contextPath}/inicio"
               class="weeks26-brand">

                <div class="weeks26-brand-logo">

                    <img
                            src="${pageContext.request.contextPath}/images/logo-instituto.png"
                            alt="Logo del instituto">

                </div>

                <div class="weeks26-brand-text">

                    <strong>
                        Abigail
                    </strong>

                    <span>
                        Portafolio Académico 2026
                    </span>

                </div>

            </a>


            <!-- MENÚ -->
            <nav class="weeks26-menu">

                <a href="${pageContext.request.contextPath}/inicio">
                    Inicio
                </a>

                <a href="${pageContext.request.contextPath}/inicio#sobre-mi">
                    Sobre mí
                </a>

                <a href="${pageContext.request.contextPath}/semanas"
                   class="active">
                    Semanas
                </a>

                <a href="${pageContext.request.contextPath}/inicio#habilidades">
                    Habilidades
                </a>

                <a href="${pageContext.request.contextPath}/inicio#contacto">
                    Contacto
                </a>

            </nav>


            <!-- LOGIN -->
            <a href="${pageContext.request.contextPath}/login"
               class="weeks26-login">

                Iniciar sesión

                <span>
                    ↗
                </span>

            </a>

        </div>

    </header>


    <main>

        <!-- =====================================================
             HERO
             ===================================================== -->
        <section class="weeks26-hero">

            <div class="weeks26-decoration deco-one"></div>
            <div class="weeks26-decoration deco-two"></div>

            <span class="weeks26-floating-star star-one">
                ✦
            </span>

            <span class="weeks26-floating-star star-two">
                ♡
            </span>


            <div class="weeks26-container weeks26-hero-grid">


                <!-- TEXTO -->
                <div class="weeks26-hero-copy">

                    <span class="weeks26-eyebrow">
                        ♡ EVIDENCIAS ACADÉMICAS
                    </span>


                    <h1>

                        Mi progreso,

                        <span>
                            semana a semana.
                        </span>

                    </h1>


                    <p>
                        Cada semana reúne actividades, documentos,
                        presentaciones, código y evidencias desarrolladas
                        durante el curso.
                    </p>


                    <a href="#lista-semanas"
                       class="weeks26-hero-button">

                        Explorar semanas

                        <span>
                            ↓
                        </span>

                    </a>

                </div>


                <!-- TARJETA DECORATIVA -->
                <div class="weeks26-hero-visual">

                    <div class="weeks26-big-shape">

                        <div class="weeks26-laptop">

                            <div class="weeks26-laptop-screen">

                                <span>
                                    &lt;/&gt;
                                </span>

                                <small>
                                    PORTAFOLIO
                                </small>

                            </div>

                            <div class="weeks26-laptop-base"></div>

                        </div>


                        <div class="weeks26-note">

                            <span>
                                2026
                            </span>

                            <strong>
                                Aprende
                            </strong>

                            <strong>
                                Practica
                            </strong>

                            <strong>
                                Crea
                            </strong>

                            <small>
                                ♡
                            </small>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- =====================================================
             MENSAJES
             ===================================================== -->

        <div class="weeks26-container weeks26-messages">

            <c:if test="${not empty sessionScope.flash}">

                <div class="weeks26-alert success">

                    <span>
                        ✓
                    </span>

                    <c:out value="${sessionScope.flash}"/>

                </div>

                <c:remove
                        var="flash"
                        scope="session"/>

            </c:if>


            <c:if test="${not empty sessionScope.flashError}">

                <div class="weeks26-alert error">

                    <span>
                        !
                    </span>

                    <c:out value="${sessionScope.flashError}"/>

                </div>

                <c:remove
                        var="flashError"
                        scope="session"/>

            </c:if>

        </div>


        <!-- =====================================================
             LISTA DE SEMANAS
             ===================================================== -->
        <section id="lista-semanas"
                 class="weeks26-content">

            <div class="weeks26-container">


                <!-- ENCABEZADO -->
                <div class="weeks26-section-heading">

                    <div>

                        <span>
                            MIS TRABAJOS
                        </span>

                        <h2>
                            Semanas académicas
                        </h2>

                    </div>


                    <p>
                        Explora cada etapa de mi aprendizaje
                        y descubre las actividades desarrolladas
                        durante el curso.
                    </p>

                </div>


                <!-- GRID -->
                <div class="weeks26-grid">

                    <c:forEach
                            var="s"
                            items="${semanas}"
                            varStatus="estado">


                        <article class="weeks26-card theme-${(estado.index % 5) + 1}">


                            <!-- PARTE SUPERIOR -->
                            <div class="weeks26-card-preview">


                                <!-- TRES PUNTITOS -->
                                <div class="weeks26-card-dots">

                                    <span></span>
                                    <span></span>
                                    <span></span>

                                </div>


                                <!-- NÚMERO GRANDE -->
                                <div class="weeks26-big-number">

                                    <c:choose>

                                        <c:when test="${s.numero < 10}">
                                            0<c:out value="${s.numero}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:out value="${s.numero}"/>
                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <!-- ILUSTRACIÓN -->
                                <div class="weeks26-card-art">

                                    <c:choose>

                                        <c:when test="${estado.index % 5 == 0}">
                                            &lt;/&gt;
                                        </c:when>

                                        <c:when test="${estado.index % 5 == 1}">
                                            ✦
                                        </c:when>

                                        <c:when test="${estado.index % 5 == 2}">
                                            ◫
                                        </c:when>

                                        <c:when test="${estado.index % 5 == 3}">
                                            ♡
                                        </c:when>

                                        <c:otherwise>
                                            { }
                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <span class="weeks26-card-mini-star">
                                    ✦
                                </span>

                            </div>


                            <!-- CONTENIDO -->
                            <div class="weeks26-card-body">

                                <span class="weeks26-card-label">

                                    SEMANA

                                    <c:choose>

                                        <c:when test="${s.numero < 10}">
                                            0<c:out value="${s.numero}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:out value="${s.numero}"/>
                                        </c:otherwise>

                                    </c:choose>

                                </span>


                                <h3>
                                    <c:out value="${s.titulo}"/>
                                </h3>


                                <p>

                                    <c:choose>

                                        <c:when test="${not empty s.descripcion}">

                                            <c:out value="${s.descripcion}"/>

                                        </c:when>

                                        <c:otherwise>

                                            Esta semana todavía no tiene
                                            una descripción registrada.

                                        </c:otherwise>

                                    </c:choose>

                                </p>


                                <div class="weeks26-card-footer">


                                    <div class="weeks26-work-count">

                                        <span>
                                            ▤
                                        </span>

                                        <strong>
                                            <c:out value="${s.totalTrabajos}"/>
                                        </strong>

                                        trabajo(s)

                                    </div>


                                    <a
                                            href="${pageContext.request.contextPath}/semanas?id=${s.id}"
                                            class="weeks26-open">

                                        Abrir semana

                                        <span>
                                            ↗
                                        </span>

                                    </a>

                                </div>

                            </div>

                        </article>

                    </c:forEach>


                    <!-- =================================================
                         SIN SEMANAS
                         ================================================= -->
                    <c:if test="${empty semanas}">

                        <div class="weeks26-empty">

                            <div class="weeks26-empty-icon">
                                ♡
                            </div>

                            <span>
                                PORTAFOLIO ACADÉMICO
                            </span>

                            <h3>
                                Aún no hay semanas registradas
                            </h3>

                            <p>
                                Las semanas académicas aparecerán
                                aquí cuando sean registradas.
                            </p>

                        </div>

                    </c:if>

                </div>

            </div>

        </section>


        <!-- =====================================================
             FINAL
             ===================================================== -->
        <section class="weeks26-end">

            <div class="weeks26-container">

                <div class="weeks26-end-card">


                    <div>

                        <span>
                            SIGUE EXPLORANDO ♡
                        </span>

                        <h2>
                            Cada semana,
                            un nuevo aprendizaje.
                        </h2>

                        <p>
                            También puedes conocer las herramientas
                            y tecnologías que forman parte de mi formación.
                        </p>

                    </div>


                    <a
                            href="${pageContext.request.contextPath}/inicio#habilidades">

                        Mis habilidades

                        <span>
                            →
                        </span>

                    </a>

                </div>

            </div>

        </section>

    </main>


    <!-- =====================================================
         FOOTER
         ===================================================== -->
    <footer class="weeks26-footer">

        <div class="weeks26-container">

            <strong>
                Abigail.
            </strong>


            <p>
                © 2026 · Portafolio Académico
            </p>


            <a href="${pageContext.request.contextPath}/inicio">

                Volver al inicio ↑

            </a>

        </div>

    </footer>

</div>


</body>
</html>