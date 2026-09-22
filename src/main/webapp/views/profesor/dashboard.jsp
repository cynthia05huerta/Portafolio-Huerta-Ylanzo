<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Dashboard Docente | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/profesor-dashboard.css?v=1">


<div class="teacher26-page">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->
    <aside class="teacher26-sidebar">

        <div>

            <!-- BRAND -->
            <a href="${pageContext.request.contextPath}/inicio"
               class="teacher26-brand">

                <div class="teacher26-logo">

                    <img
                            src="${pageContext.request.contextPath}/images/logo-instituto.png"
                            alt="Logo del instituto">

                </div>

                <div class="teacher26-brand-text">

                    <strong>
                        Docente
                    </strong>

                    <span>
                        Portafolio Académico
                    </span>

                </div>

            </a>


            <!-- MENU -->
            <nav class="teacher26-menu">

                <span class="teacher26-menu-label">
                    PANEL DOCENTE
                </span>


                <a href="${pageContext.request.contextPath}/profesor/dashboard"
                   class="teacher26-menu-item active">

                    <span class="teacher26-menu-icon">
                        ⌂
                    </span>

                    <strong>
                        Dashboard
                    </strong>

                </a>


                <a href="${pageContext.request.contextPath}/profesor/semanas"
                   class="teacher26-menu-item">

                    <span class="teacher26-menu-icon">
                        ▤
                    </span>

                    <strong>
                        Semanas
                    </strong>

                </a>


                <a href="${pageContext.request.contextPath}/profesor/entregas"
                   class="teacher26-menu-item">

                    <span class="teacher26-menu-icon">
                        ↓
                    </span>

                    <strong>
                        Entregas
                    </strong>

                </a>


                <a href="${pageContext.request.contextPath}/profesor/evaluaciones"
                   class="teacher26-menu-item">

                    <span class="teacher26-menu-icon">
                        ✦
                    </span>

                    <strong>
                        Evaluaciones
                    </strong>

                </a>


                <div class="teacher26-menu-divider"></div>


                <span class="teacher26-menu-label">
                    PORTAFOLIO
                </span>


                <a href="${pageContext.request.contextPath}/inicio"
                   class="teacher26-menu-item">

                    <span class="teacher26-menu-icon">
                        ↗
                    </span>

                    <strong>
                        Ver portafolio
                    </strong>

                </a>


                <a href="${pageContext.request.contextPath}/logout"
                   class="teacher26-menu-item logout">

                    <span class="teacher26-menu-icon">
                        ←
                    </span>

                    <strong>
                        Cerrar sesión
                    </strong>

                </a>

            </nav>

        </div>


        <!-- USUARIO -->
        <div class="teacher26-sidebar-user">

            <div class="teacher26-sidebar-avatar">
                P
            </div>

            <div>

                <span>
                    DOCENTE
                </span>

                <strong>
                    <c:out value="${usuario.nombre}"/>
                </strong>

            </div>

        </div>

    </aside>



    <!-- =====================================================
         MAIN
         ===================================================== -->
    <main class="teacher26-main">


        <!-- =================================================
             BIENVENIDA
             ================================================= -->
        <section class="teacher26-welcome">

            <div class="teacher26-welcome-copy">

                <span class="teacher26-eyebrow">
                    PANEL DOCENTE ♡
                </span>


                <h1>
                    Hola,
                    <span>
                        <c:out value="${usuario.nombre}"/>.
                    </span>
                </h1>


                <p>
                    Revisa las entregas de los estudiantes,
                    descarga evidencias y registra sus evaluaciones
                    desde un solo espacio.
                </p>

            </div>


            <div class="teacher26-user-card">

                <div class="teacher26-user-avatar">
                    P
                </div>

                <div>

                    <strong>
                        <c:out value="${usuario.nombre}"/>
                    </strong>

                    <span>
                        Docente
                    </span>

                </div>

                <small>
                    ✦
                </small>

            </div>

        </section>



        <!-- =================================================
             RESUMEN
             ================================================= -->
        <section class="teacher26-stats">


            <article class="teacher26-stat-card lavender">

                <div class="teacher26-stat-icon">
                    ▤
                </div>

                <div>

                    <span>
                        SEMANAS
                    </span>

                    <h3>
                        <c:out value="${semanas.size()}"/>
                    </h3>

                    <a href="${pageContext.request.contextPath}/profesor/semanas">
                        Ver todas →
                    </a>

                </div>

            </article>



            <article class="teacher26-stat-card blue">

                <div class="teacher26-stat-icon">
                    ↓
                </div>

                <div>

                    <span>
                        ENTREGAS
                    </span>

                    <h3>
                        Revisar trabajos
                    </h3>

                    <a href="${pageContext.request.contextPath}/profesor/entregas">
                        Consultar →
                    </a>

                </div>

            </article>



            <article class="teacher26-stat-card sage">

                <div class="teacher26-stat-icon">
                    ✦
                </div>

                <div>

                    <span>
                        EVALUACIONES
                    </span>

                    <h3>
                        Calificar
                    </h3>

                    <a href="${pageContext.request.contextPath}/profesor/evaluaciones">
                        Revisar →
                    </a>

                </div>

            </article>



            <article class="teacher26-stat-card rose">

                <div class="teacher26-stat-icon">
                    ↗
                </div>

                <div>

                    <span>
                        PORTAFOLIO
                    </span>

                    <h3>
                        Página pública
                    </h3>

                    <a href="${pageContext.request.contextPath}/inicio">
                        Visitar →
                    </a>

                </div>

            </article>

        </section>



        <!-- =================================================
             ACCIONES PRINCIPALES
             ================================================= -->
        <section class="teacher26-section">

            <div class="teacher26-section-title">

                <div>

                    <span>
                        ACCESOS RÁPIDOS
                    </span>

                    <h2>
                        ¿Qué quieres revisar hoy?
                    </h2>

                </div>

                <div class="teacher26-title-decoration">
                    ✦
                </div>

            </div>



            <div class="teacher26-actions-grid">


                <!-- ENTREGAS -->
                <a href="${pageContext.request.contextPath}/profesor/entregas"
                   class="teacher26-action-card featured">

                    <div class="teacher26-action-top">

                        <div class="teacher26-action-icon">
                            ↓
                        </div>

                        <span>
                            PRINCIPAL
                        </span>

                    </div>


                    <h3>
                        Revisar entregas
                    </h3>


                    <p>
                        Abre archivos, enlaces y evidencias
                        enviadas por los estudiantes.
                    </p>


                    <div class="teacher26-action-link">
                        Revisar trabajos
                        <span>→</span>
                    </div>

                </a>



                <!-- SEMANAS -->
                <a href="${pageContext.request.contextPath}/profesor/semanas"
                   class="teacher26-action-card">

                    <div class="teacher26-action-top">

                        <div class="teacher26-action-icon lavender-bg">
                            ▤
                        </div>

                        <span>
                            ORGANIZACIÓN
                        </span>

                    </div>


                    <h3>
                        Ver semanas
                    </h3>


                    <p>
                        Consulta todas las semanas disponibles
                        y revisa sus actividades.
                    </p>


                    <div class="teacher26-action-link">
                        Ver semanas
                        <span>→</span>
                    </div>

                </a>



                <!-- EVALUACIONES -->
                <a href="${pageContext.request.contextPath}/profesor/evaluaciones"
                   class="teacher26-action-card">

                    <div class="teacher26-action-top">

                        <div class="teacher26-action-icon sage-bg">
                            ✦
                        </div>

                        <span>
                            RETROALIMENTACIÓN
                        </span>

                    </div>


                    <h3>
                        Evaluar trabajos
                    </h3>


                    <p>
                        Registra notas sobre 20 y comentarios
                        de retroalimentación para los estudiantes.
                    </p>


                    <div class="teacher26-action-link">
                        Ir a evaluaciones
                        <span>→</span>
                    </div>

                </a>

            </div>

        </section>



        <!-- =================================================
             SEMANAS DISPONIBLES
             ================================================= -->
        <section class="teacher26-section">

            <div class="teacher26-section-title">

                <div>

                    <span>
                        CURSO
                    </span>

                    <h2>
                        Semanas disponibles
                    </h2>

                </div>

            </div>


            <div class="teacher26-weeks-grid">


                <c:forEach
                        var="s"
                        items="${semanas}"
                        varStatus="estado">


                    <article class="teacher26-week-card theme-${(estado.index % 5) + 1}">


                        <!-- VISUAL -->
                        <div class="teacher26-week-preview">

                            <div class="teacher26-week-dots">

                                <span></span>
                                <span></span>
                                <span></span>

                            </div>


                            <div class="teacher26-week-number">

                                <c:choose>

                                    <c:when test="${s.numero < 10}">
                                        0<c:out value="${s.numero}"/>
                                    </c:when>

                                    <c:otherwise>
                                        <c:out value="${s.numero}"/>
                                    </c:otherwise>

                                </c:choose>

                            </div>


                            <div class="teacher26-week-art">

                                <c:choose>

                                    <c:when test="${estado.index % 4 == 0}">
                                        &lt;/&gt;
                                    </c:when>

                                    <c:when test="${estado.index % 4 == 1}">
                                        ✦
                                    </c:when>

                                    <c:when test="${estado.index % 4 == 2}">
                                        ▤
                                    </c:when>

                                    <c:otherwise>
                                        ♡
                                    </c:otherwise>

                                </c:choose>

                            </div>

                        </div>



                        <!-- CONTENIDO -->
                        <div class="teacher26-week-body">

                            <span>
                                SEMANA
                                <c:out value="${s.numero}"/>
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
                                        Sin descripción registrada.
                                    </c:otherwise>

                                </c:choose>

                            </p>


                            <div class="teacher26-week-footer">

                                <div class="teacher26-work-count">

                                    <strong>
                                        <c:out value="${s.totalTrabajos}"/>
                                    </strong>

                                    trabajo(s)

                                </div>


                                <a href="${pageContext.request.contextPath}/profesor/semana?id=${s.id}">

                                    Revisar

                                    <span>
                                        ↗
                                    </span>

                                </a>

                            </div>

                        </div>

                    </article>

                </c:forEach>


                <c:if test="${empty semanas}">

                    <div class="teacher26-empty">

                        <div>
                            ✦
                        </div>

                        <h3>
                            No hay semanas disponibles
                        </h3>

                        <p>
                            Cuando existan semanas registradas
                            aparecerán aquí.
                        </p>

                    </div>

                </c:if>

            </div>

        </section>



        <!-- =================================================
             PANEL FINAL
             ================================================= -->
        <section class="teacher26-bottom-grid">


            <article class="teacher26-info-panel">

                <span>
                    RECORDATORIO
                </span>

                <h3>
                    Revisa las evidencias antes
                    de registrar una evaluación.
                </h3>

                <p>
                    Puedes abrir los trabajos, descargar archivos
                    y consultar enlaces externos antes de colocar
                    la nota y la retroalimentación.
                </p>


                <a href="${pageContext.request.contextPath}/profesor/entregas">
                    Ir a entregas →
                </a>

            </article>



            <article class="teacher26-profile-panel">

                <span>
                    MI CUENTA
                </span>


                <div class="teacher26-profile-avatar">
                    P
                </div>


                <h3>
                    <c:out value="${usuario.nombre}"/>
                </h3>


                <p>
                    Docente · Portafolio Académico
                </p>


                <a href="${pageContext.request.contextPath}/inicio">
                    Ver portafolio ↗
                </a>

            </article>

        </section>

    </main>

</div>

</body>
</html>