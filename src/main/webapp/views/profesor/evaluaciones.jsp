<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Evaluaciones | Docente"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/profesor-evaluaciones.css">

<div class="teacher-evaluations-page">

    <!-- SIDEBAR -->
    <aside class="teacher-evaluations-sidebar">

        <div class="teacher-evaluations-brand">

            <div class="teacher-evaluations-logo">
                P
            </div>

            <div>
                <strong>Docente.</strong>
                <span>Portafolio Académico</span>
            </div>

        </div>

        <nav class="teacher-evaluations-menu">

            <a href="${pageContext.request.contextPath}/profesor/dashboard"
               class="teacher-evaluations-menu-item">
                <span class="menu-icon">⌂</span>
                <b>Dashboard</b>
            </a>

            <a href="${pageContext.request.contextPath}/profesor/semanas"
               class="teacher-evaluations-menu-item">
                <span class="menu-icon">▦</span>
                <b>Semanas</b>
            </a>

            <a href="${pageContext.request.contextPath}/profesor/entregas"
               class="teacher-evaluations-menu-item">
                <span class="menu-icon">↓</span>
                <b>Entregas</b>
            </a>

            <a href="${pageContext.request.contextPath}/profesor/evaluaciones"
               class="teacher-evaluations-menu-item active">
                <span class="menu-icon">✓</span>
                <b>Evaluaciones</b>
            </a>

            <div class="teacher-evaluations-menu-divider"></div>

            <a href="${pageContext.request.contextPath}/inicio"
               class="teacher-evaluations-menu-item">
                <span class="menu-icon">◉</span>
                <b>Ver portafolio</b>
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="teacher-evaluations-menu-item logout">
                <span class="menu-icon">↩</span>
                <b>Cerrar sesión</b>
            </a>

        </nav>

        <div class="teacher-evaluations-sidebar-bottom">
            <span>PANEL ACADÉMICO</span>
            <p>Seguimiento y evaluación</p>
        </div>

    </aside>


    <!-- CONTENIDO -->
    <main class="teacher-evaluations-main">

        <!-- HERO -->
        <section class="teacher-evaluations-hero">

            <div class="teacher-evaluations-hero-text">

                <span class="teacher-evaluations-eyebrow">
                    PANEL DOCENTE
                </span>

                <h1>
                    Evaluaciones
                    <em>realizadas.</em>
                </h1>

                <p>
                    Consulta las calificaciones registradas,
                    revisa la retroalimentación y modifica
                    una evaluación cuando sea necesario.
                </p>

            </div>

            <div class="teacher-evaluations-decoration">

                <div class="decor-circle decor-circle-one"></div>
                <div class="decor-circle decor-circle-two"></div>

                <div class="decor-card">

                    <span>PROGRESO</span>

                    <strong>
                        <c:out value="${evaluaciones.size()}"/>
                    </strong>

                    <p>
                        evaluaciones registradas
                    </p>

                </div>

            </div>

        </section>


        <!-- CABECERA DE LISTA -->
        <section class="teacher-evaluations-section">

            <div class="teacher-evaluations-section-heading">

                <div>

                    <span class="teacher-evaluations-small-label">
                        REGISTRO ACADÉMICO
                    </span>

                    <h2>
                        Historial de evaluaciones
                    </h2>

                </div>

                <c:if test="${not empty evaluaciones}">

                    <div class="teacher-evaluations-count">

                        <strong>
                            <c:out value="${evaluaciones.size()}"/>
                        </strong>

                        <span>
                            registradas
                        </span>

                    </div>

                </c:if>

            </div>


            <!-- EVALUACIONES -->
            <div class="teacher-evaluations-grid">

                <c:forEach
                        var="e"
                        items="${evaluaciones}"
                        varStatus="estado">

                    <article class="teacher-evaluation-card">

                        <!-- NÚMERO DECORATIVO -->
                        <div class="teacher-evaluation-number">

                            <c:choose>

                                <c:when test="${estado.count < 10}">
                                    0<c:out value="${estado.count}"/>
                                </c:when>

                                <c:otherwise>
                                    <c:out value="${estado.count}"/>
                                </c:otherwise>

                            </c:choose>

                        </div>


                        <div class="teacher-evaluation-card-top">

                            <span class="teacher-evaluation-week">

                                SEMANA
                                <c:out value="${e.numeroSemana}"/>

                            </span>

                            <div class="teacher-evaluation-grade">

                                <strong>
                                    <c:out value="${e.nota}"/>
                                </strong>

                                <span>/ 20</span>

                            </div>

                        </div>


                        <h3>
                            <c:out value="${e.tituloTrabajo}"/>
                        </h3>


                        <div class="teacher-evaluation-divider"></div>


                        <div class="teacher-evaluation-feedback">

                            <span>
                                RETROALIMENTACIÓN
                            </span>

                            <c:choose>

                                <c:when test="${not empty e.contenido}">

                                    <p>
                                        <c:out value="${e.contenido}"/>
                                    </p>

                                </c:when>

                                <c:otherwise>

                                    <p class="teacher-evaluation-empty-text">
                                        No se registró un comentario
                                        para esta evaluación.
                                    </p>

                                </c:otherwise>

                            </c:choose>

                        </div>


                        <div class="teacher-evaluation-card-footer">

                            <div class="teacher-evaluation-status">
                                <span></span>
                                Evaluado
                            </div>

                            <a href="${pageContext.request.contextPath}/profesor/evaluar?trabajoId=${e.trabajoId}"
                               class="teacher-evaluation-edit-btn">

                                Editar evaluación
                                <span>→</span>

                            </a>

                        </div>

                    </article>

                </c:forEach>

            </div>


            <!-- VACÍO -->
            <c:if test="${empty evaluaciones}">

                <div class="teacher-evaluations-empty">

                    <div class="teacher-evaluations-empty-art">

                        <div class="empty-paper">

                            <span>✓</span>

                        </div>

                        <div class="empty-circle"></div>

                    </div>

                    <span class="teacher-evaluations-small-label">
                        SIN REGISTROS
                    </span>

                    <h3>
                        Todavía no hay evaluaciones
                    </h3>

                    <p>
                        Cuando revises una entrega y asignes
                        una nota, aparecerá automáticamente
                        en este espacio.
                    </p>

                    <a href="${pageContext.request.contextPath}/profesor/entregas"
                       class="teacher-evaluations-primary-btn">

                        Revisar entregas
                        <span>→</span>

                    </a>

                </div>

            </c:if>

        </section>

    </main>

</div>

</body>
</html>