<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute("pageTitle", "Entregas | Docente");
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/profesor-entregas.css">


<div class="profesor-entregas-page">

    <!-- =========================================
         SIDEBAR
         ========================================= -->
    <aside class="profesor-entregas-sidebar">

        <div class="profesor-entregas-brand">

            <div class="profesor-entregas-brand-icon">
                P
            </div>

            <div class="profesor-entregas-brand-text">
                <strong>Docente.</strong>
                <span>Portafolio Académico</span>
            </div>

        </div>


        <nav class="profesor-entregas-menu">

            <a href="${pageContext.request.contextPath}/profesor/dashboard"
               class="profesor-entregas-menu-item">

                <span>⌂</span>
                <b>Dashboard</b>

            </a>


            <a href="${pageContext.request.contextPath}/profesor/semanas"
               class="profesor-entregas-menu-item">

                <span>▦</span>
                <b>Semanas</b>

            </a>


            <a href="${pageContext.request.contextPath}/profesor/entregas"
               class="profesor-entregas-menu-item active">

                <span>↓</span>
                <b>Entregas</b>

            </a>


            <a href="${pageContext.request.contextPath}/profesor/evaluaciones"
               class="profesor-entregas-menu-item">

                <span>✓</span>
                <b>Evaluaciones</b>

            </a>


            <div class="profesor-entregas-menu-divider"></div>


            <a href="${pageContext.request.contextPath}/inicio"
               class="profesor-entregas-menu-item">

                <span>◉</span>
                <b>Ver portafolio</b>

            </a>


            <a href="${pageContext.request.contextPath}/logout"
               class="profesor-entregas-menu-item logout">

                <span>↩</span>
                <b>Cerrar sesión</b>

            </a>

        </nav>

    </aside>


    <!-- =========================================
         CONTENIDO PRINCIPAL
         ========================================= -->
    <main class="profesor-entregas-main">


        <!-- CABECERA -->
        <header class="profesor-entregas-header">

            <div>

                <span class="profesor-entregas-eyebrow">
                    PANEL DOCENTE
                </span>

                <h1>
                    Entregas académicas
                </h1>

                <p>
                    Revisa los trabajos enviados por los estudiantes,
                    descarga sus evidencias y registra sus evaluaciones.
                </p>

            </div>


            <div class="profesor-entregas-decoration">

                <div class="profesor-entregas-decoration-circle">
                    ↓
                </div>

                <span>
                    REVISIÓN
                </span>

            </div>

        </header>


        <!-- =========================================
             TÍTULO DE SECCIÓN
             ========================================= -->
        <section class="profesor-entregas-content">

            <div class="profesor-entregas-title">

                <div>

                    <span>
                        BANDEJA ACADÉMICA
                    </span>

                    <h2>
                        Trabajos recibidos
                    </h2>

                    <p>
                        Aquí encontrarás todas las evidencias
                        enviadas por los estudiantes.
                    </p>

                </div>

            </div>


            <!-- =====================================
                 LISTADO DE TRABAJOS
                 ===================================== -->
            <div class="profesor-entregas-grid">


                <c:forEach var="t"
                           items="${trabajos}"
                           varStatus="estado">


                    <article class="profesor-entrega-card">


                        <!-- NÚMERO -->
                        <div class="profesor-entrega-number">

                            <c:choose>

                                <c:when test="${estado.count < 10}">
                                    0<c:out value="${estado.count}"/>
                                </c:when>

                                <c:otherwise>
                                    <c:out value="${estado.count}"/>
                                </c:otherwise>

                            </c:choose>

                        </div>


                        <!-- ESTADO -->
                        <div class="profesor-entrega-card-top">

                            <span class="profesor-entrega-label">
                                ENTREGA
                            </span>

                            <span class="profesor-entrega-status">
                                <i></i>
                                Recibido
                            </span>

                        </div>


                        <!-- TÍTULO -->
                        <h3>
                            <c:out value="${t.titulo}"/>
                        </h3>


                        <!-- DESCRIPCIÓN -->
                        <c:choose>

                            <c:when test="${not empty t.descripcion}">

                                <p class="profesor-entrega-description">
                                    <c:out value="${t.descripcion}"/>
                                </p>

                            </c:when>

                            <c:otherwise>

                                <p class="profesor-entrega-description">
                                    Sin descripción registrada.
                                </p>

                            </c:otherwise>

                        </c:choose>


                        <!-- =================================
                             ARCHIVOS
                             ================================= -->
                        <div class="profesor-entrega-section">

                            <span class="profesor-entrega-section-title">
                                ARCHIVOS ADJUNTOS
                            </span>


                            <c:choose>


                                <c:when test="${not empty t.archivos}">


                                    <div class="profesor-entrega-files">


                                        <c:forEach var="a"
                                                   items="${t.archivos}">


                                            <div class="profesor-entrega-file">


                                                <div class="profesor-entrega-file-left">

                                                    <div class="profesor-entrega-file-icon">
                                                        PDF
                                                    </div>


                                                    <div class="profesor-entrega-file-info">

                                                        <strong>
                                                            <c:out value="${a.nombreArchivo}"/>
                                                        </strong>

                                                        <span>
                                                            Evidencia académica
                                                        </span>

                                                    </div>

                                                </div>


                                                <a
                                                        href="${pageContext.request.contextPath}/archivo/descargar?id=${a.id}"
                                                        class="profesor-entrega-download">

                                                    Descargar ↓

                                                </a>


                                            </div>


                                        </c:forEach>


                                    </div>


                                </c:when>


                                <c:otherwise>

                                    <div class="profesor-entrega-no-file">
                                        Sin archivos adjuntos
                                    </div>

                                </c:otherwise>


                            </c:choose>

                        </div>


                        <!-- =================================
                             ENLACE EXTERNO
                             ================================= -->
                        <c:if test="${not empty t.enlaceExterno}">

                            <div class="profesor-entrega-section">

                                <span class="profesor-entrega-section-title">
                                    ENLACE EXTERNO
                                </span>


                                <a
                                        href="${t.enlaceExterno}"
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        class="profesor-entrega-external">

                                    <span>↗</span>

                                    <div>

                                        <small>
                                            RECURSO DEL TRABAJO
                                        </small>

                                        <strong>
                                            Abrir enlace externo
                                        </strong>

                                    </div>

                                    <b>→</b>

                                </a>

                            </div>

                        </c:if>


                        <!-- =================================
                             BOTÓN EVALUAR
                             ================================= -->
                        <div class="profesor-entrega-footer">

                            <span>
                                Lista para revisión
                            </span>


                            <a
                                    href="${pageContext.request.contextPath}/profesor/evaluar?trabajoId=${t.id}"
                                    class="profesor-entrega-evaluate">

                                Evaluar trabajo

                                <b>→</b>

                            </a>

                        </div>


                    </article>


                </c:forEach>


                <!-- =================================
                     SIN ENTREGAS
                     ================================= -->
                <c:if test="${empty trabajos}">

                    <div class="profesor-entregas-empty">

                        <div class="profesor-entregas-empty-icon">
                            ↓
                        </div>

                        <span>
                            BANDEJA VACÍA
                        </span>

                        <h3>
                            Todavía no hay entregas
                        </h3>

                        <p>
                            Cuando los estudiantes publiquen sus trabajos,
                            aparecerán aquí para que puedas revisarlos.
                        </p>

                        <a
                                href="${pageContext.request.contextPath}/profesor/semanas"
                                class="profesor-entrega-evaluate">

                            Ver semanas →

                        </a>

                    </div>

                </c:if>


            </div>

        </section>


    </main>

</div>


</body>
</html>