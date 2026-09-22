<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Mis semanas | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/estudiante-semanas.css">


<div class="student26-layout">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->
    <aside class="student26-sidebar">

        <div>

            <!-- MARCA -->
            <div class="student26-brand">

                <div class="student26-brand-logo">
                    A
                </div>

                <div class="student26-brand-copy">
                    <strong>Abigail.</strong>
                    <span>PORTAFOLIO ACADÉMICO 2026</span>
                </div>

            </div>


            <!-- MENÚ -->
            <nav class="student26-menu">

                <a href="${pageContext.request.contextPath}/estudiante/dashboard">
                    <span class="student26-menu-icon">⌂</span>
                    <span>Dashboard</span>
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/semanas"
                   class="active">
                    <span class="student26-menu-icon">▦</span>
                    <span>Mis semanas</span>
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega">
                    <span class="student26-menu-icon">↑</span>
                    <span>Subir entrega</span>
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/evaluaciones">
                    <span class="student26-menu-icon">✓</span>
                    <span>Evaluaciones</span>
                </a>

            </nav>

        </div>


        <!-- PARTE INFERIOR -->
        <div class="student26-sidebar-bottom">

            <a href="${pageContext.request.contextPath}/inicio">
                <span>↗</span>
                Ver portafolio
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="logout">
                <span>↪</span>
                Cerrar sesión
            </a>


            <div class="student26-user">

                <div class="student26-user-avatar">
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
    <main class="student26-main">


        <!-- DECORACIONES -->
        <span class="student26-star star-one">✦</span>
        <span class="student26-star star-two">✦</span>


        <!-- =====================================================
             ENCABEZADO
             ===================================================== -->
        <header class="student26-header">

            <div class="student26-header-copy">

                <span class="student26-eyebrow">
                    ♡ ORGANIZACIÓN ACADÉMICA
                </span>

                <h1>
                    Mis <em>semanas.</em>
                </h1>

                <p>
                    Organiza tus actividades, administra tus evidencias
                    y registra cada avance de tu portafolio académico.
                </p>

            </div>


            <div class="student26-header-actions">

                <a href="${pageContext.request.contextPath}/estudiante/semana/nueva"
                   class="student26-btn-light">
                    <span>＋</span>
                    Nueva semana
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega"
                   class="student26-btn-primary">
                    <span>＋</span>
                    Nueva entrega
                </a>

            </div>

        </header>


        <!-- =====================================================
             MENSAJES
             ===================================================== -->
        <c:if test="${not empty sessionScope.flash}">

            <div class="student26-alert success">

                <span>✓</span>

                <c:out value="${sessionScope.flash}"/>

            </div>

            <c:remove var="flash"
                      scope="session"/>

        </c:if>


        <c:if test="${not empty sessionScope.flashError}">

            <div class="student26-alert error">

                <span>!</span>

                <c:out value="${sessionScope.flashError}"/>

            </div>

            <c:remove var="flashError"
                      scope="session"/>

        </c:if>


        <!-- =====================================================
             TÍTULO DE LISTADO
             ===================================================== -->
        <div class="student26-section-title">

            <div>

                <span>
                    PORTAFOLIO 2026
                </span>

                <h2>
                    Todas las semanas
                </h2>

            </div>

            <p>
                Cada semana reúne tus actividades y trabajos académicos.
            </p>

        </div>


        <!-- =====================================================
             SEMANAS
             ===================================================== -->
        <section class="student26-weeks">

            <c:forEach var="s"
                       items="${semanas}"
                       varStatus="estado">


                <article class="student26-week-card">


                    <!-- PARTE DECORATIVA -->
                    <div class="student26-week-art">

                        <div class="student26-window-dots">
                            <i></i>
                            <i></i>
                            <i></i>
                        </div>


                        <div class="student26-big-number">

                            <c:choose>

                                <c:when test="${s.numero < 10}">
                                    0<c:out value="${s.numero}"/>
                                </c:when>

                                <c:otherwise>
                                    <c:out value="${s.numero}"/>
                                </c:otherwise>

                            </c:choose>

                        </div>


                        <div class="student26-art-icon">

                            <c:choose>

                                <c:when test="${estado.index % 4 == 0}">
                                    &lt;/&gt;
                                </c:when>

                                <c:when test="${estado.index % 4 == 1}">
                                    ✦
                                </c:when>

                                <c:when test="${estado.index % 4 == 2}">
                                    ▣
                                </c:when>

                                <c:otherwise>
                                    ♡
                                </c:otherwise>

                            </c:choose>

                        </div>


                        <span class="student26-art-circle circle-one"></span>
                        <span class="student26-art-circle circle-two"></span>

                    </div>


                    <!-- INFORMACIÓN -->
                    <div class="student26-week-content">

                        <div class="student26-week-meta">

                            <span>
                                SEMANA
                                <c:out value="${s.numero}"/>
                            </span>

                            <div class="student26-work-count">
                                <span>▤</span>

                                <c:out value="${s.totalTrabajos}"/>

                                trabajo(s)
                            </div>

                        </div>


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


                        <!-- ACCIONES -->
                        <div class="student26-week-actions">

                            <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega?semana=${s.id}"
                               class="student26-upload">

                                <span>＋</span>
                                Subir entrega

                            </a>


                            <a href="${pageContext.request.contextPath}/estudiante/semana?id=${s.id}"
                               class="student26-view">

                                Ver trabajos
                                <span>→</span>

                            </a>

                        </div>


                        <!-- ADMINISTRACIÓN -->
                        <div class="student26-admin-actions">


                            <a href="${pageContext.request.contextPath}/estudiante/semana/editar?id=${s.id}"
                               class="student26-edit">

                                <span>✎</span>
                                Editar

                            </a>


                            <form method="post"
                                  action="${pageContext.request.contextPath}/estudiante/semana/eliminar">

                                <input type="hidden"
                                       name="id"
                                       value="${s.id}">


                                <button type="submit"
                                        class="student26-delete"
                                        onclick="return confirm('¿Seguro que deseas eliminar la Semana ${s.numero}?');">

                                    <span>⌫</span>
                                    Eliminar

                                </button>

                            </form>

                        </div>

                    </div>

                </article>

            </c:forEach>


            <!-- =====================================================
                 VACÍO
                 ===================================================== -->
            <c:if test="${empty semanas}">

                <div class="student26-empty">

                    <div class="student26-empty-icon">
                        ＋
                    </div>

                    <span>
                        PORTAFOLIO ACADÉMICO
                    </span>

                    <h3>
                        Crea tu primera semana
                    </h3>

                    <p>
                        Empieza a organizar tus actividades,
                        trabajos y evidencias académicas.
                    </p>

                    <a href="${pageContext.request.contextPath}/estudiante/semana/nueva"
                       class="student26-btn-primary">

                        ＋ Crear primera semana

                    </a>

                </div>

            </c:if>

        </section>


        <!-- =====================================================
             BLOQUE FINAL
             ===================================================== -->
        <section class="student26-bottom-card">

            <div>

                <span class="student26-eyebrow">
                    TU PORTAFOLIO
                </span>

                <h2>
                    Sigue creando,
                    <em>semana a semana.</em>
                </h2>

                <p>
                    Cada actividad forma parte de tu progreso
                    y aprendizaje académico.
                </p>

            </div>


            <div class="student26-bottom-decoration">

                <div class="student26-mini-book book-one"></div>
                <div class="student26-mini-book book-two"></div>
                <div class="student26-mini-book book-three"></div>

                <span>♡</span>

            </div>

        </section>


    </main>

</div>

</body>
</html>