<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Nueva semana | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/estudiante-nueva-semana.css">


<div class="newweek26-layout">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->
    <aside class="newweek26-sidebar">

        <div>

            <a href="${pageContext.request.contextPath}/inicio"
               class="newweek26-brand">

                <div class="newweek26-brand-logo">
                    A
                </div>

                <div class="newweek26-brand-copy">

                    <strong>
                        Abigail.
                    </strong>

                    <span>
                        PORTAFOLIO ACADÉMICO 2026
                    </span>

                </div>

            </a>


            <nav class="newweek26-menu">

                <a href="${pageContext.request.contextPath}/estudiante/dashboard">

                    <span class="newweek26-menu-icon">
                        ⌂
                    </span>

                    Dashboard

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/semanas"
                   class="active">

                    <span class="newweek26-menu-icon">
                        ▦
                    </span>

                    Mis semanas

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega">

                    <span class="newweek26-menu-icon">
                        ↑
                    </span>

                    Subir entrega

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/evaluaciones">

                    <span class="newweek26-menu-icon">
                        ✓
                    </span>

                    Evaluaciones

                </a>

            </nav>

        </div>


        <div class="newweek26-sidebar-bottom">

            <a href="${pageContext.request.contextPath}/inicio">

                <span>
                    ↗
                </span>

                Ver portafolio

            </a>


            <a href="${pageContext.request.contextPath}/logout"
               class="logout">

                <span>
                    ↪
                </span>

                Cerrar sesión

            </a>


            <div class="newweek26-user">

                <div class="newweek26-user-avatar">
                    A
                </div>

                <div>

                    <span>
                        ESTUDIANTE
                    </span>

                    <strong>
                        Abigail
                    </strong>

                </div>

            </div>

        </div>

    </aside>



    <!-- =====================================================
         CONTENIDO
         ===================================================== -->
    <main class="newweek26-main">

        <span class="newweek26-star star-one">
            ✦
        </span>

        <span class="newweek26-star star-two">
            ♡
        </span>


        <!-- =================================================
             HEADER
             ================================================= -->
        <header class="newweek26-header">

            <div>

                <span class="newweek26-eyebrow">
                    ♡ ORGANIZACIÓN DEL CURSO
                </span>

                <h1>
                    Agregar
                    <em>nueva semana.</em>
                </h1>

                <p>
                    Crea una nueva semana para organizar tus trabajos,
                    actividades y evidencias académicas.
                </p>

            </div>


            <div class="newweek26-header-card">

                <span>
                    PORTAFOLIO
                </span>

                <strong>
                    Organiza
                </strong>

                <strong>
                    Crea
                </strong>

                <strong>
                    Avanza
                </strong>

                <small>
                    ♡
                </small>

            </div>

        </header>



        <!-- =================================================
             FORMULARIO
             ================================================= -->
        <section class="newweek26-card">

            <form
                    method="post"
                    action="${pageContext.request.contextPath}/estudiante/semana/nueva"
                    class="newweek26-form">


                <!-- =================================================
                     01 NÚMERO
                     ================================================= -->
                <section class="newweek26-form-section">

                    <div class="newweek26-number">
                        01
                    </div>


                    <div class="newweek26-section-content">

                        <span class="newweek26-section-label">
                            SEMANA
                        </span>

                        <h2>
                            Número de semana
                        </h2>

                        <p>
                            Indica el número correspondiente a la nueva
                            semana que deseas agregar.
                        </p>


                        <div class="newweek26-field">

                            <label for="numero">
                                Número
                            </label>

                            <input
                                    type="number"
                                    id="numero"
                                    name="numero"
                                    class="newweek26-input"
                                    min="1"
                                    placeholder="Ej. 5"
                                    required>

                        </div>

                    </div>

                </section>



                <!-- =================================================
                     02 TÍTULO
                     ================================================= -->
                <section class="newweek26-form-section">

                    <div class="newweek26-number">
                        02
                    </div>


                    <div class="newweek26-section-content">

                        <span class="newweek26-section-label">
                            INFORMACIÓN
                        </span>

                        <h2>
                            Título de la semana
                        </h2>

                        <p>
                            Escribe un título claro que identifique
                            los temas o actividades de esta semana.
                        </p>


                        <div class="newweek26-field">

                            <label for="titulo">
                                Título
                            </label>

                            <input
                                    type="text"
                                    id="titulo"
                                    name="titulo"
                                    class="newweek26-input"
                                    maxlength="255"
                                    placeholder="Ej. Introducción a Spring MVC"
                                    required>

                        </div>

                    </div>

                </section>



                <!-- =================================================
                     03 DESCRIPCIÓN
                     ================================================= -->
                <section class="newweek26-form-section">

                    <div class="newweek26-number">
                        03
                    </div>


                    <div class="newweek26-section-content">

                        <span class="newweek26-section-label">
                            DESCRIPCIÓN
                        </span>

                        <h2>
                            Temas desarrollados
                        </h2>

                        <p>
                            Resume brevemente los temas que se trabajarán
                            o que se desarrollaron durante esta semana.
                        </p>


                        <div class="newweek26-field">

                            <label for="descripcion">
                                Descripción
                            </label>

                            <textarea
                                    id="descripcion"
                                    name="descripcion"
                                    class="newweek26-textarea"
                                    rows="6"
                                    placeholder="Describe brevemente los temas de esta semana..."></textarea>

                        </div>

                    </div>

                </section>



                <!-- =================================================
                     BOTONES
                     ================================================= -->
                <div class="newweek26-actions">

                    <a
                            href="${pageContext.request.contextPath}/estudiante/semanas"
                            class="newweek26-cancel">

                        ← Cancelar

                    </a>


                    <button
                            type="submit"
                            class="newweek26-submit">

                        ＋ Crear semana

                        <span>
                            →
                        </span>

                    </button>

                </div>

            </form>

        </section>



        <!-- =================================================
             BLOQUE INFERIOR
             ================================================= -->
        <section class="newweek26-tip">

            <div class="newweek26-tip-icon">
                ✦
            </div>

            <div>

                <span>
                    CONSEJO
                </span>

                <h3>
                    Usa títulos claros para cada semana
                </h3>

                <p>
                    Así podrás identificar rápidamente las actividades
                    y evidencias que corresponden a cada etapa del curso.
                </p>

            </div>

            <div class="newweek26-tip-heart">
                ♡
            </div>

        </section>

    </main>

</div>


</body>
</html>