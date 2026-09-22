<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Trabajos de la semana | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/estudiante-detalle-semana.css?v=1">


<div class="weekdetail26-layout">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->
    <aside class="weekdetail26-sidebar">

        <div>

            <a href="${pageContext.request.contextPath}/inicio"
               class="weekdetail26-brand">

                <div class="weekdetail26-brand-logo">
                    A
                </div>

                <div class="weekdetail26-brand-copy">
                    <strong>Abigail.</strong>
                    <span>PORTAFOLIO ACADÉMICO 2026</span>
                </div>

            </a>


            <nav class="weekdetail26-menu">

                <a href="${pageContext.request.contextPath}/estudiante/dashboard">
                    <span class="weekdetail26-menu-icon">⌂</span>
                    Dashboard
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/semanas"
                   class="active">
                    <span class="weekdetail26-menu-icon">▦</span>
                    Mis semanas
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega">
                    <span class="weekdetail26-menu-icon">↑</span>
                    Subir entrega
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/evaluaciones">
                    <span class="weekdetail26-menu-icon">✓</span>
                    Evaluaciones
                </a>

            </nav>

        </div>


        <div class="weekdetail26-sidebar-bottom">

            <a href="${pageContext.request.contextPath}/inicio">
                <span>↗</span>
                Ver portafolio
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="logout">
                <span>↪</span>
                Cerrar sesión
            </a>

            <div class="weekdetail26-user">

                <div class="weekdetail26-user-avatar">
                    A
                </div>

                <div>
                    <span>ESTUDIANTE</span>
                    <strong>Abigail</strong>
                </div>

            </div>

        </div>

    </aside>


    <!-- =====================================================
         CONTENIDO
         ===================================================== -->
    <main class="weekdetail26-main">

        <span class="weekdetail26-star star-one">✦</span>
        <span class="weekdetail26-star star-two">♡</span>


        <!-- =================================================
             MENSAJES
             ================================================= -->
        <c:if test="${not empty sessionScope.flash}">

            <div class="weekdetail26-alert success">

                <span>✓</span>

                <div>
                    <strong>¡Cambios guardados!</strong>

                    <p>
                        <c:out value="${sessionScope.flash}"/>
                    </p>
                </div>

            </div>

            <c:remove var="flash" scope="session"/>

        </c:if>


        <c:if test="${not empty sessionScope.flashError}">

            <div class="weekdetail26-alert error">

                <span>!</span>

                <div>
                    <strong>Ocurrió un problema</strong>

                    <p>
                        <c:out value="${sessionScope.flashError}"/>
                    </p>
                </div>

            </div>

            <c:remove var="flashError" scope="session"/>

        </c:if>


        <!-- =================================================
             HERO DE LA SEMANA
             ================================================= -->
        <header class="weekdetail26-hero">

            <div class="weekdetail26-hero-copy">

                <span class="weekdetail26-eyebrow">
                    ♡ SEMANA
                    <c:out value="${semana.numero}"/>
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


                <div class="weekdetail26-hero-actions">

                    <a
                            href="${pageContext.request.contextPath}/estudiante/nueva-entrega?semana=${semana.id}"
                            class="weekdetail26-primary">

                        <span>＋</span>
                        Subir entrega

                    </a>

                    <a
                            href="${pageContext.request.contextPath}/estudiante/semanas"
                            class="weekdetail26-secondary">

                        ← Volver a mis semanas

                    </a>

                </div>

            </div>


            <!-- DECORACIÓN -->
            <div class="weekdetail26-hero-art">

                <div class="weekdetail26-shape">

                    <span class="weekdetail26-shape-label">
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


                    <div class="weekdetail26-code">
                        &lt;/&gt;
                    </div>

                </div>

                <div class="weekdetail26-note">
                    <span>PORTAFOLIO</span>
                    <strong>Aprender</strong>
                    <strong>Crear</strong>
                    <strong>Mejorar</strong>
                    <small>♡</small>
                </div>

            </div>

        </header>


        <!-- =================================================
             CABECERA DE TRABAJOS
             ================================================= -->
        <section class="weekdetail26-section-heading">

            <div>

                <span>
                    EVIDENCIAS ACADÉMICAS
                </span>

                <h2>
                    Trabajos de esta semana
                </h2>

            </div>

            <p>
                Aquí puedes revisar, descargar, editar o eliminar
                las evidencias registradas en esta semana.
            </p>

        </section>


        <!-- =================================================
             LISTA
             ================================================= -->
        <section class="weekdetail26-work-list">

            <c:forEach
                    var="t"
                    items="${trabajos}"
                    varStatus="estado">


                <article class="weekdetail26-work-card">


                    <!-- CABECERA -->
                    <div class="weekdetail26-work-top">

                        <div class="weekdetail26-work-number">

                            <c:choose>

                                <c:when test="${t.id < 10}">
                                    0<c:out value="${t.id}"/>
                                </c:when>

                                <c:otherwise>
                                    <c:out value="${t.id}"/>
                                </c:otherwise>

                            </c:choose>

                        </div>


                        <div class="weekdetail26-work-title">

                            <span>
                                ENTREGA ACADÉMICA
                            </span>

                            <h3>
                                <c:out value="${t.titulo}"/>
                            </h3>

                        </div>


                        <c:if test="${not empty t.fechaEntrega}">

                            <div class="weekdetail26-date">

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
                    <div class="weekdetail26-description">

                        <span>
                            DESCRIPCIÓN
                        </span>

                        <p>

                            <c:choose>

                                <c:when test="${not empty t.descripcion}">
                                    <c:out value="${t.descripcion}"/>
                                </c:when>

                                <c:otherwise>
                                    Esta entrega no tiene descripción.
                                </c:otherwise>

                            </c:choose>

                        </p>

                    </div>


                    <!-- =================================================
                         ARCHIVOS
                         ================================================= -->
                    <div class="weekdetail26-content-block">

                        <div class="weekdetail26-block-heading">

                            <div class="weekdetail26-block-icon">
                                ▤
                            </div>

                            <div>
                                <span>ARCHIVOS</span>
                                <strong>Evidencias adjuntas</strong>
                            </div>

                        </div>


                        <c:choose>

                            <c:when test="${not empty t.archivos}">

                                <div class="weekdetail26-file-list">

                                    <c:forEach
                                            var="a"
                                            items="${t.archivos}">

                                        <div class="weekdetail26-file">

                                            <div class="weekdetail26-file-info">

                                                <div class="weekdetail26-file-icon">
                                                    📄
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
                                                    class="weekdetail26-download">

                                                Descargar
                                                <span>↓</span>

                                            </a>

                                        </div>

                                    </c:forEach>

                                </div>

                            </c:when>


                            <c:otherwise>

                                <div class="weekdetail26-no-file">

                                    <span>📂</span>

                                    Esta entrega no tiene archivos adjuntos.

                                </div>

                            </c:otherwise>

                        </c:choose>

                    </div>


                    <!-- =================================================
                         ENLACE EXTERNO
                         ================================================= -->
                    <c:if test="${not empty t.enlaceExterno}">

                        <div class="weekdetail26-content-block">

                            <div class="weekdetail26-block-heading">

                                <div class="weekdetail26-block-icon link">
                                    ↗
                                </div>

                                <div>
                                    <span>ENLACE EXTERNO</span>
                                    <strong>Recurso del trabajo</strong>
                                </div>

                            </div>


                            <a
                                    href="${t.enlaceExterno}"
                                    target="_blank"
                                    rel="noopener noreferrer"
                                    class="weekdetail26-external">

                                <div>
                                    <span>🔗</span>
                                    Abrir enlace externo
                                </div>

                                <span>↗</span>

                            </a>

                        </div>

                    </c:if>


                    <!-- =================================================
                         FOOTER
                         ================================================= -->
                    <div class="weekdetail26-work-footer">

                        <span>
                            Trabajo #
                            <c:out value="${t.id}"/>
                        </span>


                        <div class="weekdetail26-management">

                            <a
                                    href="${pageContext.request.contextPath}/estudiante/trabajo/editar?id=${t.id}"
                                    class="weekdetail26-edit">

                                <span>✎</span>
                                Editar entrega

                            </a>


                            <form
                                    method="post"
                                    action="${pageContext.request.contextPath}/estudiante/trabajo/eliminar"
                                    onsubmit="return confirm('¿Estás segura de eliminar esta entrega? Esta acción no se puede deshacer.');">

                                <input
                                        type="hidden"
                                        name="id"
                                        value="${t.id}">


                                <button
                                        type="submit"
                                        class="weekdetail26-delete">

                                    <span>⌫</span>
                                    Eliminar entrega

                                </button>

                            </form>

                        </div>

                    </div>

                </article>

            </c:forEach>


            <!-- =================================================
                 SIN TRABAJOS
                 ================================================= -->
            <c:if test="${empty trabajos}">

                <div class="weekdetail26-empty">

                    <div class="weekdetail26-empty-art">

                        <div class="weekdetail26-empty-folder">
                            ♡
                        </div>

                        <span class="weekdetail26-empty-star">
                            ✦
                        </span>

                    </div>


                    <span class="weekdetail26-empty-label">
                        ESTA SEMANA
                    </span>


                    <h2>
                        Aún no has subido
                        <em>trabajos.</em>
                    </h2>


                    <p>
                        Puedes registrar tu primera evidencia usando
                        el botón “Subir entrega”.
                    </p>


                    <a
                            href="${pageContext.request.contextPath}/estudiante/nueva-entrega?semana=${semana.id}"
                            class="weekdetail26-primary">

                        ＋ Subir primera entrega

                    </a>

                </div>

            </c:if>

        </section>


        <!-- =================================================
             FINAL
             ================================================= -->
        <section class="weekdetail26-bottom">

            <div>

                <span>
                    MI PORTAFOLIO ♡
                </span>

                <h2>
                    Sigue construyendo
                    tu progreso.
                </h2>

                <p>
                    Cada evidencia refleja una parte de tu aprendizaje.
                </p>

            </div>


            <a
                    href="${pageContext.request.contextPath}/estudiante/semanas">

                Ver mis semanas
                <span>→</span>

            </a>

        </section>

    </main>

</div>

</body>
</html>