<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Dashboard Estudiante | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/estudiante-dashboard.css?v=1">


<div class="student26-page">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->
    <aside class="student26-sidebar">

        <div>

            <!-- LOGO -->
            <a href="${pageContext.request.contextPath}/inicio"
               class="student26-brand">

                <div class="student26-logo">

                    <img
                            src="${pageContext.request.contextPath}/images/logo-instituto.png"
                            alt="Logo del instituto">

                </div>

                <div class="student26-brand-text">

                    <strong>
                        Abigail
                    </strong>

                    <span>
                        Portafolio Académico
                    </span>

                </div>

            </a>


            <!-- MENU -->
            <nav class="student26-menu">

                <span class="student26-menu-label">
                    PANEL
                </span>


                <a href="${pageContext.request.contextPath}/estudiante/dashboard"
                   class="student26-menu-item active">

                    <span class="student26-menu-icon">
                        ⌂
                    </span>

                    <strong>
                        Dashboard
                    </strong>

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/semanas"
                   class="student26-menu-item">

                    <span class="student26-menu-icon">
                        ▤
                    </span>

                    <strong>
                        Mis semanas
                    </strong>

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega"
                   class="student26-menu-item">

                    <span class="student26-menu-icon">
                        ↑
                    </span>

                    <strong>
                        Subir entrega
                    </strong>

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/evaluaciones"
                   class="student26-menu-item">

                    <span class="student26-menu-icon">
                        ✦
                    </span>

                    <strong>
                        Evaluaciones
                    </strong>

                </a>


                <div class="student26-menu-divider"></div>


                <span class="student26-menu-label">
                    PORTAFOLIO
                </span>


                <a href="${pageContext.request.contextPath}/inicio"
                   class="student26-menu-item">

                    <span class="student26-menu-icon">
                        ↗
                    </span>

                    <strong>
                        Ver portafolio
                    </strong>

                </a>


                <a href="${pageContext.request.contextPath}/logout"
                   class="student26-menu-item logout">

                    <span class="student26-menu-icon">
                        ←
                    </span>

                    <strong>
                        Cerrar sesión
                    </strong>

                </a>

            </nav>

        </div>


        <!-- CUENTA -->
        <div class="student26-sidebar-user">

            <div class="student26-sidebar-avatar">
                A
            </div>

            <div>

                <span>
                    ESTUDIANTE
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
    <main class="student26-main">


        <!-- =================================================
             TOP
             ================================================= -->
        <section class="student26-welcome">

            <div class="student26-welcome-copy">

                <span class="student26-eyebrow">
                    PANEL ACADÉMICO ♡
                </span>


                <h1>
                    Hola,
                    <span>
                        <c:out value="${usuario.nombre}"/>.
                    </span>
                </h1>


                <p>
                    Gestiona tus entregas, revisa tus semanas
                    y consulta tus evaluaciones desde un solo lugar.
                </p>

            </div>


            <!-- CUENTA SUPERIOR -->
            <div class="student26-user-card">

                <div class="student26-user-avatar">
                    A
                </div>

                <div>

                    <strong>
                        <c:out value="${usuario.nombre}"/>
                    </strong>

                    <span>
                        Estudiante
                    </span>

                </div>

                <small>
                    ♡
                </small>

            </div>

        </section>



        <!-- =================================================
             RESUMEN
             ================================================= -->
        <section class="student26-stats">


            <!-- SEMANAS -->
            <article class="student26-stat-card rose">

                <div class="student26-stat-icon">
                    ▤
                </div>

                <div>

                    <span>
                        SEMANAS
                    </span>

                    <h3>
                        Ver todas
                    </h3>

                    <a href="${pageContext.request.contextPath}/estudiante/semanas">
                        Administrar →
                    </a>

                </div>

            </article>



            <!-- ENTREGAS -->
            <article class="student26-stat-card lavender">

                <div class="student26-stat-icon">
                    ↑
                </div>

                <div>

                    <span>
                        ENTREGAS
                    </span>

                    <h3>
                        Mis trabajos
                    </h3>

                    <a href="${pageContext.request.contextPath}/estudiante/semanas">
                        Consultar →
                    </a>

                </div>

            </article>



            <!-- EVALUACIONES -->
            <article class="student26-stat-card sage">

                <div class="student26-stat-icon">
                    ✦
                </div>

                <div>

                    <span>
                        EVALUACIONES
                    </span>

                    <h3>
                        Notas y comentarios
                    </h3>

                    <a href="${pageContext.request.contextPath}/estudiante/evaluaciones">
                        Revisar →
                    </a>

                </div>

            </article>



            <!-- PORTAFOLIO -->
            <article class="student26-stat-card peach">

                <div class="student26-stat-icon">
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
             ACCESOS RÁPIDOS
             ================================================= -->
        <section class="student26-section">

            <div class="student26-section-title">

                <div>

                    <span>
                        ACCESOS RÁPIDOS
                    </span>

                    <h2>
                        ¿Qué quieres hacer hoy?
                    </h2>

                </div>

                <div class="student26-title-decoration">
                    ✦
                </div>

            </div>



            <div class="student26-actions-grid">


                <!-- SUBIR ENTREGA -->
                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega"
                   class="student26-action-card featured">

                    <div class="student26-action-top">

                        <div class="student26-action-icon">
                            ↑
                        </div>

                        <span>
                            PRINCIPAL
                        </span>

                    </div>


                    <h3>
                        Subir nueva entrega
                    </h3>


                    <p>
                        Selecciona la semana, agrega título,
                        descripción, archivos y un enlace externo.
                    </p>


                    <div class="student26-action-link">
                        Comenzar entrega
                        <span>→</span>
                    </div>

                </a>



                <!-- SEMANAS -->
                <a href="${pageContext.request.contextPath}/estudiante/semanas"
                   class="student26-action-card">

                    <div class="student26-action-top">

                        <div class="student26-action-icon lavender-bg">
                            ▤
                        </div>

                        <span>
                            ORGANIZACIÓN
                        </span>

                    </div>


                    <h3>
                        Mis semanas
                    </h3>


                    <p>
                        Revisa y administra todas las actividades
                        que has realizado durante el curso.
                    </p>


                    <div class="student26-action-link">
                        Ver semanas
                        <span>→</span>
                    </div>

                </a>



                <!-- EVALUACIONES -->
                <a href="${pageContext.request.contextPath}/estudiante/evaluaciones"
                   class="student26-action-card">

                    <div class="student26-action-top">

                        <div class="student26-action-icon sage-bg">
                            ✦
                        </div>

                        <span>
                            RETROALIMENTACIÓN
                        </span>

                    </div>


                    <h3>
                        Mis evaluaciones
                    </h3>


                    <p>
                        Consulta las notas y comentarios
                        registrados por el profesor.
                    </p>


                    <div class="student26-action-link">
                        Ver evaluaciones
                        <span>→</span>
                    </div>

                </a>

            </div>

        </section>



        <!-- =================================================
             PARTE INFERIOR
             ================================================= -->
        <section class="student26-bottom-grid">


            <!-- PROGRESO -->
            <article class="student26-progress-panel">


                <div class="student26-panel-header">

                    <div>

                        <span>
                            MI PROGRESO
                        </span>

                        <h3>
                            Actividad académica
                        </h3>

                    </div>


                    <a href="${pageContext.request.contextPath}/estudiante/semanas">
                        Ver todas →
                    </a>

                </div>



                <div class="student26-progress-list">


                    <!-- SEMANA 01 -->
                    <div class="student26-progress-item">

                        <div class="student26-progress-number rose-number">
                            01
                        </div>

                        <div class="student26-progress-info">

                            <strong>
                                Semana 01
                            </strong>

                            <span>
                                Introducción y entorno
                            </span>

                        </div>

                        <span class="student26-badge">
                            Disponible
                        </span>

                    </div>



                    <!-- SEMANA 02 -->
                    <div class="student26-progress-item">

                        <div class="student26-progress-number green-number">
                            02
                        </div>

                        <div class="student26-progress-info">

                            <strong>
                                Semana 02
                            </strong>

                            <span>
                                Base de datos y modelado
                            </span>

                        </div>

                        <span class="student26-badge">
                            Disponible
                        </span>

                    </div>



                    <!-- SEMANA 03 -->
                    <div class="student26-progress-item">

                        <div class="student26-progress-number blue-number">
                            03
                        </div>

                        <div class="student26-progress-info">

                            <strong>
                                Semana 03
                            </strong>

                            <span>
                                Arquitectura Web MVC
                            </span>

                        </div>

                        <span class="student26-badge">
                            Disponible
                        </span>

                    </div>

                </div>

            </article>



            <!-- PERFIL -->
            <article class="student26-profile-panel">

                <span class="student26-profile-label">
                    MI CUENTA
                </span>


                <div class="student26-profile-avatar">
                    A
                </div>


                <h3>
                    <c:out value="${usuario.nombre}"/>
                </h3>


                <p>
                    Estudiante · Portafolio Académico
                </p>


                <div class="student26-profile-details">

                    <div>

                        <span>
                            Rol
                        </span>

                        <strong>
                            Estudiante
                        </strong>

                    </div>


                    <div>

                        <span>
                            Curso
                        </span>

                        <strong>
                            Portafolio Académico
                        </strong>

                    </div>

                </div>


                <a href="${pageContext.request.contextPath}/inicio"
                   class="student26-profile-btn">

                    Ver mi portafolio

                    <span>
                        ↗
                    </span>

                </a>

            </article>

        </section>

    </main>

</div>


</body>
</html>