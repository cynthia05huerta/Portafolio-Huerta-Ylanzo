<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Semanas | Docente"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/profesor-semanas.css">


<div class="cpanel-layout profesor-weeks-page">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->
    <aside class="cpanel-sidebar">

        <div class="cpanel-brand">

            <div class="cpanel-brand-icon">
                P
            </div>

            <div class="cpanel-brand-text">
                <strong>Docente.</strong>
                <span>Portafolio Académico</span>
            </div>

        </div>


        <nav class="cpanel-menu">

            <a href="${pageContext.request.contextPath}/profesor/dashboard"
               class="cpanel-menu-item">

                <span class="menu-icon">⌂</span>
                <b>Dashboard</b>

            </a>


            <a href="${pageContext.request.contextPath}/profesor/semanas"
               class="cpanel-menu-item active">

                <span class="menu-icon">▦</span>
                <b>Semanas</b>

            </a>


            <a href="${pageContext.request.contextPath}/profesor/entregas"
               class="cpanel-menu-item">

                <span class="menu-icon">↓</span>
                <b>Entregas</b>

            </a>


            <a href="${pageContext.request.contextPath}/profesor/evaluaciones"
               class="cpanel-menu-item">

                <span class="menu-icon">✓</span>
                <b>Evaluaciones</b>

            </a>


            <div class="cpanel-menu-divider"></div>


            <a href="${pageContext.request.contextPath}/inicio"
               class="cpanel-menu-item">

                <span class="menu-icon">◎</span>
                <b>Ver portafolio</b>

            </a>


            <a href="${pageContext.request.contextPath}/logout"
               class="cpanel-menu-item logout">

                <span class="menu-icon">↩</span>
                <b>Cerrar sesión</b>

            </a>

        </nav>


        <div class="profesor-sidebar-note">

            <span>PORTAFOLIO</span>

            <strong>
                Académico 2026
            </strong>

            <p>
                Panel de revisión docente.
            </p>

        </div>

    </aside>


    <!-- =====================================================
         CONTENIDO
         ===================================================== -->
    <main class="cpanel-main profesor-weeks-main">


        <!-- =================================================
             ENCABEZADO
             ================================================= -->
        <header class="profesor-weeks-header">

            <div class="profesor-header-copy">

                <div class="profesor-small-pill">
                    ✦ PANEL DOCENTE
                </div>

                <h1>
                    Semanas
                    <span>académicas.</span>
                </h1>

                <p>
                    Explora las semanas del curso y revisa las
                    evidencias académicas enviadas por los estudiantes.
                </p>

            </div>


            <div class="profesor-header-art">

                <div class="profesor-art-circle circle-one"></div>
                <div class="profesor-art-circle circle-two"></div>

                <div class="profesor-art-card">

                    <span>
                        CURSO
                    </span>

                    <strong>
                        Portafolio
                        Académico
                    </strong>

                    <small>
                        2026
                    </small>

                </div>

                <div class="profesor-art-star">
                    ✦
                </div>

            </div>

        </header>


        <!-- =================================================
             TÍTULO DE LISTA
             ================================================= -->
        <section class="profesor-weeks-section">

            <div class="profesor-section-heading">

                <div>

                    <span class="profesor-section-label">
                        ORGANIZACIÓN DEL CURSO
                    </span>

                    <h2>
                        Todas las semanas
                    </h2>

                </div>


                <div class="profesor-section-message">

                    <span class="message-dot"></span>

                    Selecciona una semana para revisar
                    sus entregas.

                </div>

            </div>


            <!-- =============================================
                 LISTADO DE SEMANAS
                 ============================================= -->
            <div class="profesor-week-grid">

                <c:forEach
                        var="s"
                        items="${semanas}"
                        varStatus="estado">


                    <article class="profesor-week-card">

                        <!-- DECORACIÓN -->
                        <div class="profesor-week-decoration">

                            <div class="week-decoration-circle"></div>

                            <span>
                                ✦
                            </span>

                        </div>


                        <!-- NÚMERO -->
                        <div class="profesor-week-top">

                            <div class="profesor-week-number">

                                <small>
                                    SEMANA
                                </small>

                                <strong>

                                    <c:choose>

                                        <c:when test="${s.numero < 10}">
                                            0<c:out value="${s.numero}"/>
                                        </c:when>

                                        <c:otherwise>
                                            <c:out value="${s.numero}"/>
                                        </c:otherwise>

                                    </c:choose>

                                </strong>

                            </div>


                            <div class="profesor-week-status">

                                <span></span>

                                Disponible

                            </div>

                        </div>


                        <!-- INFORMACIÓN -->
                        <div class="profesor-week-content">

                            <span class="profesor-week-label">
                                ACTIVIDAD ACADÉMICA
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
                                        Semana académica del portafolio.
                                    </c:otherwise>

                                </c:choose>

                            </p>

                        </div>


                        <!-- PIE -->
                        <div class="profesor-week-footer">

                            <div class="profesor-deliveries">

                                <div class="profesor-deliveries-icon">
                                    ↓
                                </div>

                                <div>

                                    <strong>
                                        <c:out value="${s.totalTrabajos}"/>
                                    </strong>

                                    <span>
                                        entrega(s)
                                    </span>

                                </div>

                            </div>


                            <a
                                    href="${pageContext.request.contextPath}/profesor/semana?id=${s.id}"
                                    class="profesor-review-btn">

                                Revisar

                                <span>
                                    →
                                </span>

                            </a>

                        </div>

                    </article>

                </c:forEach>


                <!-- =========================================
                     CUANDO NO EXISTEN SEMANAS
                     ========================================= -->
                <c:if test="${empty semanas}">

                    <div class="profesor-weeks-empty">

                        <div class="profesor-empty-icon">
                            ♡
                        </div>

                        <span>
                            PORTAFOLIO ACADÉMICO
                        </span>

                        <h3>
                            Todavía no existen semanas
                        </h3>

                        <p>
                            Cuando se registren semanas académicas,
                            aparecerán aquí para que puedas revisar
                            las entregas de los estudiantes.
                        </p>

                    </div>

                </c:if>

            </div>

        </section>


        <!-- =================================================
             BLOQUE INFERIOR
             ================================================= -->
        <section class="profesor-weeks-bottom">

            <div>

                <span>
                    ✦ ESPACIO DOCENTE
                </span>

                <h2>
                    Revisa, evalúa y acompaña
                    el progreso académico.
                </h2>

            </div>


            <a href="${pageContext.request.contextPath}/profesor/entregas"
               class="profesor-all-deliveries">

                Ver todas las entregas

                <span>
                    →
                </span>

            </a>

        </section>

    </main>

</div>

</body>
</html>