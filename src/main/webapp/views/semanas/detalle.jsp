<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Detalle de Semana | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/detalle-semana.css">


<div class="detail26-page">

    <!-- =====================================================
         HEADER
         ===================================================== -->
    <header class="detail26-header">

        <div class="detail26-container detail26-nav">

            <!-- LOGO -->
            <a href="${pageContext.request.contextPath}/inicio"
               class="detail26-brand">

                <div class="detail26-brand-logo">

                    <img
                            src="${pageContext.request.contextPath}/images/logo-instituto.png"
                            alt="Logo del instituto">

                </div>

                <div class="detail26-brand-text">

                    <strong>
                        Abigail
                    </strong>

                    <span>
                        Portafolio Académico 2026
                    </span>

                </div>

            </a>


            <!-- MENÚ -->
            <nav class="detail26-menu">

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


            <a href="${pageContext.request.contextPath}/login"
               class="detail26-login">

                Iniciar sesión
                <span>↗</span>

            </a>

        </div>

    </header>



    <main>

        <!-- =====================================================
             HERO DE LA SEMANA
             ===================================================== -->
        <section class="detail26-hero">

            <div class="detail26-decoration deco-a"></div>
            <div class="detail26-decoration deco-b"></div>

            <span class="detail26-star star-a">✦</span>
            <span class="detail26-star star-b">♡</span>


            <div class="detail26-container detail26-hero-grid">

                <!-- TEXTO -->
                <div class="detail26-hero-copy">

                    <span class="detail26-eyebrow">

                        SEMANA

                        <c:choose>

                            <c:when test="${semana.numero < 10}">
                                0<c:out value="${semana.numero}"/>
                            </c:when>

                            <c:otherwise>
                                <c:out value="${semana.numero}"/>
                            </c:otherwise>

                        </c:choose>

                    </span>


                    <h1>
                        <c:out value="${semana.titulo}"/>
                    </h1>


                    <p>

                        <c:choose>

                            <c:when test="${not empty semana.descripcion}">
                                <c:out value="${semana.descripcion}"/>
                            </c:when>

                            <c:otherwise>
                                Esta semana todavía no tiene una descripción registrada.
                            </c:otherwise>

                        </c:choose>

                    </p>


                    <a href="${pageContext.request.contextPath}/semanas"
                       class="detail26-back">

                        <span>←</span>

                        Volver a todas las semanas

                    </a>

                </div>



                <!-- VISUAL -->
                <div class="detail26-hero-visual">

                    <div class="detail26-shape">

                        <div class="detail26-visual-number">

                            <span>
                                SEMANA
                            </span>

                            <strong>

                                <c:choose>

                                    <c:when test="${semana.numero < 10}">
                                        0<c:out value="${semana.numero}"/>
                                    </c:when>

                                    <c:otherwise>
                                        <c:out value="${semana.numero}"/>
                                    </c:otherwise>

                                </c:choose>

                            </strong>

                        </div>


                        <div class="detail26-code-card">

                            <span>&lt;/&gt;</span>

                            <small>
                                EVIDENCIAS
                            </small>

                        </div>


                        <div class="detail26-note">

                            <small>
                                PORTAFOLIO 2026
                            </small>

                            <strong>
                                Aprender
                            </strong>

                            <strong>
                                Practicar
                            </strong>

                            <strong>
                                Crear
                            </strong>

                            <span>♡</span>

                        </div>

                    </div>

                </div>

            </div>

        </section>



        <!-- =====================================================
             TRABAJOS
             ===================================================== -->
        <section class="detail26-content">

            <div class="detail26-container">


                <!-- ENCABEZADO -->
                <div class="detail26-section-heading">

                    <div>

                        <span>
                            EVIDENCIAS ACADÉMICAS
                        </span>

                        <h2>
                            Trabajos de esta semana
                        </h2>

                    </div>


                    <p>
                        Aquí encontrarás los trabajos, archivos y enlaces
                        correspondientes a esta semana académica.
                    </p>

                </div>



                <!-- LISTA -->
                <div class="detail26-work-list">


                    <c:forEach
                            var="t"
                            items="${trabajos}"
                            varStatus="estado">


                        <article class="detail26-work-card">


                            <!-- BARRA SUPERIOR -->
                            <div class="detail26-work-top">


                                <!-- NÚMERO -->
                                <div class="detail26-work-number">

                                    <c:choose>

                                        <c:when test="${t.id < 10}">
                                            0<c:out value="${t.id}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:out value="${t.id}"/>
                                        </c:otherwise>

                                    </c:choose>

                                </div>



                                <!-- TÍTULO -->
                                <div class="detail26-work-title">

                                    <span>
                                        TRABAJO ACADÉMICO
                                    </span>

                                    <h3>
                                        <c:out value="${t.titulo}"/>
                                    </h3>

                                </div>



                                <!-- FECHA -->
                                <c:if test="${not empty t.fechaEntrega}">

                                    <div class="detail26-work-date">

                                        <span>
                                            FECHA
                                        </span>

                                        <strong>
                                            <c:out value="${t.fechaEntrega}"/>
                                        </strong>

                                    </div>

                                </c:if>

                            </div>



                            <!-- DESCRIPCIÓN -->
                            <div class="detail26-description">

                                <span>
                                    DESCRIPCIÓN
                                </span>

                                <p>

                                    <c:choose>

                                        <c:when test="${not empty t.descripcion}">
                                            <c:out value="${t.descripcion}"/>
                                        </c:when>

                                        <c:otherwise>
                                            Este trabajo no tiene una descripción registrada.
                                        </c:otherwise>

                                    </c:choose>

                                </p>

                            </div>



                            <!-- =================================================
                                 ARCHIVOS
                                 ================================================= -->
                            <div class="detail26-work-section">

                                <div class="detail26-work-section-title">

                                    <div class="detail26-section-icon">
                                        ▤
                                    </div>

                                    <div>

                                        <span>
                                            ARCHIVOS ADJUNTOS
                                        </span>

                                        <strong>
                                            Material de la actividad
                                        </strong>

                                    </div>

                                </div>



                                <c:choose>

                                    <c:when test="${not empty t.archivos}">

                                        <div class="detail26-file-list">


                                            <c:forEach
                                                    var="a"
                                                    items="${t.archivos}">


                                                <a
                                                        href="${pageContext.request.contextPath}/archivo/descargar?id=${a.id}"
                                                        class="detail26-file-item">


                                                    <div class="detail26-file-icon">
                                                        📄
                                                    </div>


                                                    <div class="detail26-file-info">

                                                        <strong>
                                                            <c:out value="${a.nombreArchivo}"/>
                                                        </strong>

                                                        <span>
                                                            Archivo adjunto
                                                        </span>

                                                    </div>


                                                    <div class="detail26-file-download">

                                                        Descargar

                                                        <span>
                                                            ↓
                                                        </span>

                                                    </div>

                                                </a>

                                            </c:forEach>


                                        </div>

                                    </c:when>



                                    <c:otherwise>

                                        <div class="detail26-no-file">

                                            <div>
                                                📂
                                            </div>

                                            <span>
                                                Sin archivo adjunto
                                            </span>

                                        </div>

                                    </c:otherwise>

                                </c:choose>

                            </div>



                            <!-- =================================================
                                 ENLACE EXTERNO
                                 ================================================= -->
                            <c:if test="${not empty t.enlaceExterno}">

                                <div class="detail26-work-section">

                                    <div class="detail26-work-section-title">

                                        <div class="detail26-section-icon external">
                                            ↗
                                        </div>

                                        <div>

                                            <span>
                                                ENLACE EXTERNO
                                            </span>

                                            <strong>
                                                Recurso complementario
                                            </strong>

                                        </div>

                                    </div>


                                    <a
                                            href="${t.enlaceExterno}"
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            class="detail26-external-link">

                                        <div>

                                            <span>
                                                🔗
                                            </span>

                                            <strong>
                                                Abrir enlace externo
                                            </strong>

                                        </div>

                                        <span>
                                            ↗
                                        </span>

                                    </a>

                                </div>

                            </c:if>


                        </article>

                    </c:forEach>



                    <!-- =================================================
                         SIN TRABAJOS
                         ================================================= -->
                    <c:if test="${empty trabajos}">

                        <div class="detail26-empty">

                            <div class="detail26-empty-art">

                                <div class="detail26-empty-circle">

                                    <span>
                                        &lt;/&gt;
                                    </span>

                                </div>

                                <span class="detail26-empty-star">
                                    ✦
                                </span>

                                <span class="detail26-empty-heart">
                                    ♡
                                </span>

                            </div>


                            <span class="detail26-empty-label">
                                EVIDENCIAS ACADÉMICAS
                            </span>


                            <h3>
                                Aún no hay trabajos publicados
                            </h3>


                            <p>
                                Las evidencias de esta semana aparecerán aquí
                                cuando sean publicadas.
                            </p>


                            <a href="${pageContext.request.contextPath}/semanas">

                                Volver a semanas

                                <span>
                                    →
                                </span>

                            </a>

                        </div>

                    </c:if>


                </div>

            </div>

        </section>



        <!-- =====================================================
             FINAL
             ===================================================== -->
        <section class="detail26-final">

            <div class="detail26-container">

                <div class="detail26-final-card">

                    <div>

                        <span>
                            PORTAFOLIO ACADÉMICO ♡
                        </span>

                        <h2>
                            Sigue explorando
                            mis semanas.
                        </h2>

                        <p>
                            Cada actividad representa una parte
                            de mi proceso de aprendizaje.
                        </p>

                    </div>


                    <a href="${pageContext.request.contextPath}/semanas">

                        Ver todas las semanas

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
    <footer class="detail26-footer">

        <div class="detail26-container">

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