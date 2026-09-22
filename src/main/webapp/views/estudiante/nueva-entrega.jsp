<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Nueva entrega | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/estudiante-entrega.css">


<div class="delivery26-layout">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->
    <aside class="delivery26-sidebar">

        <div>

            <a href="${pageContext.request.contextPath}/inicio"
               class="delivery26-brand">

                <div class="delivery26-brand-logo">
                    A
                </div>

                <div class="delivery26-brand-copy">

                    <strong>
                        Abigail.
                    </strong>

                    <span>
                        PORTAFOLIO ACADÉMICO 2026
                    </span>

                </div>

            </a>


            <nav class="delivery26-menu">

                <a href="${pageContext.request.contextPath}/estudiante/dashboard">

                    <span class="delivery26-menu-icon">
                        ⌂
                    </span>

                    Dashboard

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/semanas">

                    <span class="delivery26-menu-icon">
                        ▦
                    </span>

                    Mis semanas

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega"
                   class="active">

                    <span class="delivery26-menu-icon">
                        ↑
                    </span>

                    Subir entrega

                </a>


                <a href="${pageContext.request.contextPath}/estudiante/evaluaciones">

                    <span class="delivery26-menu-icon">
                        ✓
                    </span>

                    Evaluaciones

                </a>

            </nav>

        </div>


        <div class="delivery26-sidebar-bottom">

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


            <div class="delivery26-user">

                <div class="delivery26-user-avatar">
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
         MAIN
         ===================================================== -->
    <main class="delivery26-main">

        <span class="delivery26-star star-one">
            ✦
        </span>

        <span class="delivery26-star star-two">
            ♡
        </span>


        <!-- =================================================
             HEADER
             ================================================= -->
        <header class="delivery26-header">

            <div>

                <span class="delivery26-eyebrow">
                    ♡ NUEVA ENTREGA
                </span>

                <h1>
                    Subir
                    <em>trabajo.</em>
                </h1>

                <p>
                    Registra una nueva evidencia dentro de una semana
                    del curso y organiza tu progreso académico.
                </p>

            </div>


            <div class="delivery26-header-card">

                <span>
                    PORTAFOLIO
                </span>

                <strong>
                    Crear
                </strong>

                <strong>
                    Organizar
                </strong>

                <strong>
                    Avanzar
                </strong>

                <small>
                    ♡
                </small>

            </div>

        </header>



        <!-- =================================================
             FORMULARIO
             ================================================= -->
        <section class="delivery26-card">

            <form
                    action="${pageContext.request.contextPath}/estudiante/entrega/guardar"
                    method="post"
                    enctype="multipart/form-data"
                    class="delivery26-form">


                <!-- =================================================
                     01 SEMANA
                     ================================================= -->
                <section class="delivery26-form-section">

                    <div class="delivery26-number">
                        01
                    </div>


                    <div class="delivery26-section-content">

                        <span class="delivery26-section-label">
                            SEMANA
                        </span>

                        <h2>
                            Selecciona la semana correspondiente
                        </h2>

                        <p>
                            Elige en qué semana deseas registrar
                            esta nueva evidencia académica.
                        </p>


                        <div class="delivery26-field">

                            <label for="idSemana">
                                Semana del curso
                            </label>

                            <select
                                    id="idSemana"
                                    name="idSemana"
                                    class="delivery26-input"
                                    required>

                                <option value="">
                                    Seleccionar semana
                                </option>


                                <c:forEach var="s"
                                           items="${semanas}">

                                    <option
                                            value="${s.id}"
                                        ${semanaSeleccionada == s.id
                                                ? 'selected'
                                                : ''}>

                                        Semana
                                        <c:out value="${s.numero}"/>
                                        -
                                        <c:out value="${s.titulo}"/>

                                    </option>

                                </c:forEach>

                            </select>

                        </div>

                    </div>

                </section>



                <!-- =================================================
                     02 INFORMACIÓN
                     ================================================= -->
                <section class="delivery26-form-section">

                    <div class="delivery26-number">
                        02
                    </div>


                    <div class="delivery26-section-content">

                        <span class="delivery26-section-label">
                            INFORMACIÓN
                        </span>

                        <h2>
                            Información de la entrega
                        </h2>

                        <p>
                            Agrega un título claro y una breve descripción
                            del trabajo que estás registrando.
                        </p>


                        <div class="delivery26-fields-grid">


                            <div class="delivery26-field">

                                <label for="titulo">
                                    Título del trabajo
                                </label>

                                <input
                                        type="text"
                                        id="titulo"
                                        name="titulo"
                                        class="delivery26-input"
                                        placeholder="Ej. Desarrollo de aplicación Java Web"
                                        required>

                            </div>


                            <div class="delivery26-field full">

                                <label for="descripcion">
                                    Descripción
                                </label>

                                <textarea
                                        id="descripcion"
                                        name="descripcion"
                                        class="delivery26-textarea"
                                        rows="6"
                                        placeholder="Describe brevemente tu trabajo..."
                                        required></textarea>

                            </div>

                        </div>

                    </div>

                </section>



                <!-- =================================================
                     03 ARCHIVO
                     ================================================= -->
                <section class="delivery26-form-section">

                    <div class="delivery26-number">
                        03
                    </div>


                    <div class="delivery26-section-content">

                        <span class="delivery26-section-label">
                            ARCHIVO
                        </span>

                        <h2>
                            Adjuntar evidencia
                        </h2>

                        <p>
                            Puedes subir un documento, archivo comprimido
                            o imagen correspondiente al trabajo.
                        </p>


                        <label class="delivery26-file-box">

                            <div class="delivery26-file-icon">
                                ↑
                            </div>

                            <strong>
                                Selecciona tu archivo
                            </strong>

                            <span>
                                PDF, Word, ZIP o imagen
                            </span>

                            <small>
                                Haz clic aquí para buscar el archivo
                            </small>


                            <input
                                    type="file"
                                    name="archivo">

                        </label>

                    </div>

                </section>



                <!-- =================================================
                     04 ENLACE
                     ================================================= -->
                <section class="delivery26-form-section">

                    <div class="delivery26-number">
                        04
                    </div>


                    <div class="delivery26-section-content">

                        <span class="delivery26-section-label">
                            ENLACE EXTERNO
                        </span>

                        <h2>
                            Agregar enlace
                        </h2>

                        <p>
                            Si tu trabajo tiene un recurso en línea,
                            puedes agregarlo aquí.
                        </p>


                        <div class="delivery26-field">

                            <label for="enlace">
                                Enlace del trabajo
                            </label>

                            <div class="delivery26-url-wrap">

                                <span>
                                    ↗
                                </span>

                                <input
                                        type="url"
                                        id="enlace"
                                        name="enlace"
                                        class="delivery26-input"
                                        placeholder="GitHub, Figma, Drive o Demo">

                            </div>

                        </div>

                    </div>

                </section>



                <!-- =================================================
                     BOTONES
                     ================================================= -->
                <div class="delivery26-actions">

                    <a href="${pageContext.request.contextPath}/estudiante/semanas"
                       class="delivery26-cancel">

                        ← Cancelar

                    </a>


                    <button
                            type="submit"
                            class="delivery26-submit">

                        Publicar entrega

                        <span>
                            →
                        </span>

                    </button>

                </div>

            </form>

        </section>



        <!-- =================================================
             CONSEJO
             ================================================= -->
        <section class="delivery26-tip">

            <div class="delivery26-tip-icon">
                ✦
            </div>

            <div>

                <span>
                    CONSEJO
                </span>

                <h3>
                    Organiza bien cada evidencia
                </h3>

                <p>
                    Usa títulos claros y descripciones breves para que
                    tus trabajos sean fáciles de identificar en el portafolio.
                </p>

            </div>

            <div class="delivery26-tip-heart">
                ♡
            </div>

        </section>

    </main>

</div>


</body>
</html>