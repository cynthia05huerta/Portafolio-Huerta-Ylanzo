<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Mis evaluaciones | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/estudiante-evaluaciones.css">


<div class="eval26-layout">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->
    <aside class="eval26-sidebar">

        <div>

            <a href="${pageContext.request.contextPath}/inicio"
               class="eval26-brand">

                <div class="eval26-brand-logo">
                    A
                </div>

                <div class="eval26-brand-copy">
                    <strong>Abigail.</strong>
                    <span>PORTAFOLIO ACADÉMICO 2026</span>
                </div>

            </a>


            <nav class="eval26-menu">

                <a href="${pageContext.request.contextPath}/estudiante/dashboard">
                    <span class="eval26-menu-icon">⌂</span>
                    Dashboard
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/semanas">
                    <span class="eval26-menu-icon">▦</span>
                    Mis semanas
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega">
                    <span class="eval26-menu-icon">↑</span>
                    Subir entrega
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/evaluaciones"
                   class="active">
                    <span class="eval26-menu-icon">✓</span>
                    Evaluaciones
                </a>

            </nav>

        </div>


        <div class="eval26-sidebar-bottom">

            <a href="${pageContext.request.contextPath}/inicio">
                <span>↗</span>
                Ver portafolio
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="logout">
                <span>↪</span>
                Cerrar sesión
            </a>

            <div class="eval26-user">

                <div class="eval26-user-avatar">
                    A
                </div>

                <div>
                    <span>ESTUDIANTE</span>
                    <strong>
                        <c:out value="${usuario.nombre}"/>
                    </strong>
                </div>

            </div>

        </div>

    </aside>


    <!-- =====================================================
         CONTENIDO
         ===================================================== -->
    <main class="eval26-main">

        <span class="eval26-decoration eval26-decoration-one">✦</span>
        <span class="eval26-decoration eval26-decoration-two">♡</span>


        <!-- =================================================
             HERO
             ================================================= -->
        <header class="eval26-hero">

            <div class="eval26-hero-copy">

                <span class="eval26-eyebrow">
                    ♡ MI PROGRESO ACADÉMICO
                </span>

                <h1>
                    Mis
                    <em>evaluaciones.</em>
                </h1>

                <p>
                    Consulta las notas y comentarios registrados por
                    el docente y observa tu progreso en cada trabajo.
                </p>

            </div>


            <div class="eval26-hero-art">

                <div class="eval26-art-circle">
                    <span>✦</span>
                    <strong>20</strong>
                    <small>NOTA MÁXIMA</small>
                </div>

                <div class="eval26-art-line"></div>

                <span class="eval26-art-heart">
                    ♡
                </span>

            </div>

        </header>


        <!-- =================================================
             TÍTULO DE SECCIÓN
             ================================================= -->
        <section class="eval26-section-heading">

            <div>
                <span>RESULTADOS</span>
                <h2>Historial de evaluaciones</h2>
            </div>

            <div class="eval26-section-pill">
                Tu progreso ♡
            </div>

        </section>


        <!-- =================================================
             EVALUACIONES
             ================================================= -->
        <section class="eval26-grid">

            <c:forEach var="e"
                       items="${evaluaciones}"
                       varStatus="estado">

                <article class="eval26-card">

                    <!-- PARTE SUPERIOR -->
                    <div class="eval26-card-top">

                        <div class="eval26-card-number">

                            <c:choose>

                                <c:when test="${e.numeroSemana < 10}">
                                    0<c:out value="${e.numeroSemana}"/>
                                </c:when>

                                <c:otherwise>
                                    <c:out value="${e.numeroSemana}"/>
                                </c:otherwise>

                            </c:choose>

                        </div>


                        <div class="eval26-card-heading">

                            <span>
                                SEMANA
                                <c:out value="${e.numeroSemana}"/>
                            </span>

                            <h2>
                                <c:out value="${e.tituloTrabajo}"/>
                            </h2>

                        </div>


                        <div class="eval26-grade">

                            <c:choose>

                                <c:when test="${not empty e.nota}">

                                    <span>NOTA</span>

                                    <div>
                                        <strong>
                                            <c:out value="${e.nota}"/>
                                        </strong>

                                        <small>/20</small>
                                    </div>

                                </c:when>

                                <c:otherwise>

                                    <span>ESTADO</span>
                                    <strong class="pending">
                                        —
                                    </strong>
                                    <small>Pendiente</small>

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>


                    <!-- COMENTARIO -->
                    <div class="eval26-comment">

                        <div class="eval26-quote">
                            “
                        </div>

                        <div>

                            <span class="eval26-small-label">
                                COMENTARIO DEL DOCENTE
                            </span>

                            <c:choose>

                                <c:when test="${not empty e.contenido}">

                                    <p>
                                        <c:out value="${e.contenido}"/>
                                    </p>

                                </c:when>

                                <c:otherwise>

                                    <p class="eval26-muted">
                                        El docente no dejó comentarios
                                        en esta evaluación.
                                    </p>

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>


                    <!-- FOOTER -->
                    <div class="eval26-card-footer">

                        <div class="eval26-status">

                            <c:choose>

                                <c:when test="${not empty e.nota}">
                                    <span class="eval26-status-dot"></span>
                                    Evaluado
                                </c:when>

                                <c:otherwise>
                                    <span class="eval26-status-dot pending"></span>
                                    Pendiente
                                </c:otherwise>

                            </c:choose>

                        </div>


                        <c:if test="${not empty e.fechaComentario}">

                            <div class="eval26-date">
                                Evaluado:
                                <strong>
                                    <c:out value="${e.fechaComentario}"/>
                                </strong>
                            </div>

                        </c:if>

                    </div>

                </article>

            </c:forEach>


            <!-- =================================================
                 VACÍO
                 ================================================= -->
            <c:if test="${empty evaluaciones}">

                <div class="eval26-empty">

                    <div class="eval26-empty-art">

                        <div class="eval26-empty-paper">
                            <span>✓</span>

                            <div></div>
                            <div></div>
                            <div></div>
                        </div>

                        <span class="eval26-empty-star">
                            ✦
                        </span>

                        <span class="eval26-empty-heart">
                            ♡
                        </span>

                    </div>


                    <span class="eval26-empty-label">
                        TU PROGRESO
                    </span>

                    <h2>
                        Aún no tienes
                        <em>evaluaciones.</em>
                    </h2>

                    <p>
                        Cuando el docente revise tus entregas,
                        aquí aparecerán tus notas, comentarios
                        y retroalimentación.
                    </p>


                    <a href="${pageContext.request.contextPath}/estudiante/semanas"
                       class="eval26-empty-button">

                        Ver mis semanas

                        <span>→</span>

                    </a>

                </div>

            </c:if>

        </section>


        <!-- =================================================
             MENSAJE FINAL
             ================================================= -->
        <c:if test="${not empty evaluaciones}">

            <section class="eval26-message">

                <div class="eval26-message-icon">
                    ✦
                </div>

                <div>
                    <span>RECUERDA</span>

                    <h3>
                        Cada evaluación es parte de tu progreso.
                    </h3>

                    <p>
                        Revisa los comentarios de tu docente para seguir
                        mejorando tus próximos trabajos.
                    </p>
                </div>

                <div class="eval26-message-heart">
                    ♡
                </div>

            </section>

        </c:if>

    </main>

</div>

</body>
</html>