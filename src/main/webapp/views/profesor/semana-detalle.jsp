<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Detalle de semana | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/profesor-semana-detalle.css">

<div class="cpanel-layout">

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


            <a href="${pageContext.request.contextPath}/logout"
               class="cpanel-menu-item logout">

                <span class="menu-icon">↩</span>
                <b>Cerrar sesión</b>

            </a>

        </nav>

    </aside>


    <!-- =====================================================
         CONTENIDO
         ===================================================== -->
    <main class="cpanel-main">


        <!-- =================================================
             CABECERA
             ================================================= -->
        <header class="cpanel-topbar">

            <div class="week-heading">

                <a href="${pageContext.request.contextPath}/profesor/semanas"
                   class="back-link">

                    <span>←</span>
                    Volver a semanas

                </a>


                <div class="week-heading-content">

                    <div>

                        <span class="cpanel-eyebrow">
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
                                    Esta semana no tiene una descripción registrada.
                                </c:otherwise>

                            </c:choose>
                        </p>

                    </div>


                    <div class="week-number-decoration">

                        <small>SEMANA</small>

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

                </div>

            </div>

        </header>


        <!-- =================================================
             TÍTULO DE ENTREGAS
             ================================================= -->
        <section class="works-heading">

            <div>

                <span>REVISIÓN ACADÉMICA</span>

                <h2>
                    Entregas del estudiante
                </h2>

            </div>


            <p>
                Revisa los trabajos, archivos y enlaces correspondientes
                a esta semana antes de realizar la evaluación.
            </p>

        </section>


        <!-- =================================================
             TRABAJOS
             ================================================= -->
        <section class="student-work-list">

            <c:forEach var="t"
                       items="${trabajos}"
                       varStatus="estado">


                <article class="student-work-card">


                    <!-- CABECERA DE TARJETA -->
                    <div class="student-work-header">

                        <div class="student-work-number">
                            <c:out value="${estado.index + 1}"/>
                        </div>


                        <div class="student-work-title">

                            <span class="student-work-label">
                                ENTREGA DEL ESTUDIANTE
                            </span>

                            <h2>
                                <c:out value="${t.titulo}"/>
                            </h2>

                        </div>


                        <div class="work-status">
                            Entregado
                        </div>

                    </div>


                    <!-- DESCRIPCIÓN -->
                    <div class="student-work-description-box">

                        <span class="student-work-small-title">
                            DESCRIPCIÓN
                        </span>


                        <p class="student-work-description">

                            <c:choose>

                                <c:when test="${not empty t.descripcion}">
                                    <c:out value="${t.descripcion}"/>
                                </c:when>

                                <c:otherwise>
                                    El estudiante no agregó una descripción.
                                </c:otherwise>

                            </c:choose>

                        </p>

                    </div>


                    <!-- =========================================
                         ARCHIVOS
                         ========================================= -->
                    <c:if test="${not empty t.archivos}">

                        <div class="student-work-section">

                            <div class="section-title-row">

                                <span class="student-work-small-title">
                                    ARCHIVOS ADJUNTOS
                                </span>

                                <span class="file-counter">
                                    Documentos
                                </span>

                            </div>


                            <div class="student-files-list">

                                <c:forEach var="a"
                                           items="${t.archivos}">

                                    <div class="student-file-row">


                                        <div class="student-file-info">

                                            <div class="student-file-icon">
                                                PDF
                                            </div>


                                            <div>

                                                <strong>
                                                    <c:out value="${a.nombreArchivo}"/>
                                                </strong>

                                                <span>
                                                    Archivo adjunto
                                                </span>

                                            </div>

                                        </div>


                                        <a
                                                href="${pageContext.request.contextPath}/archivo/descargar?id=${a.id}"
                                                class="download-button">

                                            Descargar

                                            <span>↓</span>

                                        </a>

                                    </div>

                                </c:forEach>

                            </div>

                        </div>

                    </c:if>


                    <!-- =========================================
                         ENLACE EXTERNO
                         ========================================= -->
                    <c:if test="${not empty t.enlaceExterno}">

                        <div class="student-work-section">

                            <span class="student-work-small-title">
                                ENLACE EXTERNO
                            </span>


                            <a href="${t.enlaceExterno}"
                               target="_blank"
                               rel="noopener noreferrer"
                               class="external-work-link">

                                <span class="external-icon">
                                    ↗
                                </span>

                                <div>

                                    <strong>
                                        Abrir recurso externo
                                    </strong>

                                    <small>
                                        Ver contenido en una nueva pestaña
                                    </small>

                                </div>

                                <span class="external-arrow">
                                    →
                                </span>

                            </a>

                        </div>

                    </c:if>


                    <!-- =========================================
                         ACCIONES
                         ========================================= -->
                    <div class="student-work-management">

                        <div class="evaluation-help">

                            <span>✦</span>

                            <p>
                                Revisa la evidencia antes de asignar
                                una calificación.
                            </p>

                        </div>


                        <a
                                href="${pageContext.request.contextPath}/profesor/evaluar?trabajoId=${t.id}"
                                class="btn-primary">

                            <span>✎</span>
                            Evaluar trabajo

                        </a>

                    </div>

                </article>

            </c:forEach>


            <!-- =================================================
                 SIN TRABAJOS
                 ================================================= -->
            <c:if test="${empty trabajos}">

                <div class="student-work-empty">

                    <div class="student-work-empty-icon">
                        ♡
                    </div>

                    <span>
                        SIN ENTREGAS
                    </span>

                    <h3>
                        No hay trabajos en esta semana
                    </h3>

                    <p>
                        Cuando el estudiante registre una entrega,
                        aparecerá en esta sección.
                    </p>

                </div>

            </c:if>

        </section>


        <!-- =================================================
             PIE INTERNO
             ================================================= -->
        <div class="page-bottom">

            <span>
                Portafolio Académico 2026
            </span>

            <a href="${pageContext.request.contextPath}/profesor/semanas">
                ← Volver a semanas
            </a>

        </div>

    </main>

</div>

</body>
</html>