<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Editar entrega | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/estudiante-editar-trabajo.css">


<div class="editwork26-layout">

    <aside class="editwork26-sidebar">

        <div>

            <a href="${pageContext.request.contextPath}/inicio"
               class="editwork26-brand">

                <div class="editwork26-brand-logo">
                    A
                </div>

                <div class="editwork26-brand-copy">
                    <strong>Abigail.</strong>
                    <span>PORTAFOLIO ACADÉMICO 2026</span>
                </div>

            </a>


            <nav class="editwork26-menu">

                <a href="${pageContext.request.contextPath}/estudiante/dashboard">
                    <span class="editwork26-menu-icon">⌂</span>
                    Dashboard
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/semanas"
                   class="active">
                    <span class="editwork26-menu-icon">▦</span>
                    Mis semanas
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega">
                    <span class="editwork26-menu-icon">↑</span>
                    Subir entrega
                </a>

                <a href="${pageContext.request.contextPath}/estudiante/evaluaciones">
                    <span class="editwork26-menu-icon">✓</span>
                    Evaluaciones
                </a>

            </nav>

        </div>


        <div class="editwork26-sidebar-bottom">

            <a href="${pageContext.request.contextPath}/inicio">
                <span>↗</span>
                Ver portafolio
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="logout">
                <span>↪</span>
                Cerrar sesión
            </a>

            <div class="editwork26-user">

                <div class="editwork26-user-avatar">
                    A
                </div>

                <div>
                    <span>ESTUDIANTE</span>
                    <strong>Abigail</strong>
                </div>

            </div>

        </div>

    </aside>


    <main class="editwork26-main">

        <span class="editwork26-star star-one">✦</span>
        <span class="editwork26-star star-two">♡</span>


        <header class="editwork26-header">

            <div>

                <span class="editwork26-eyebrow">
                    ♡ MODIFICAR ENTREGA
                </span>

                <h1>
                    Editar
                    <em>trabajo.</em>
                </h1>

                <p>
                    Corrige la información, elimina archivos equivocados
                    o adjunta nuevos archivos sin perder tu entrega.
                </p>

            </div>


            <div class="editwork26-header-card">

                <span>ENTREGA</span>

                <strong>Revisar</strong>
                <strong>Corregir</strong>
                <strong>Mejorar</strong>

                <small>♡</small>

            </div>

        </header>


        <c:if test="${not empty sessionScope.flashError}">

            <div class="editwork26-alert error">

                <span>!</span>

                <div>

                    <strong>
                        No se pudo guardar
                    </strong>

                    <p>
                        <c:out value="${sessionScope.flashError}"/>
                    </p>

                </div>

            </div>

            <c:remove var="flashError"
                      scope="session"/>

        </c:if>


        <section class="editwork26-card">

            <form
                    method="post"
                    action="${pageContext.request.contextPath}/estudiante/trabajo/editar"
                    enctype="multipart/form-data"
                    class="editwork26-form">

                <input
                        type="hidden"
                        name="id"
                        value="${trabajo.id}">


                <!-- 01 -->
                <section class="editwork26-section">

                    <div class="editwork26-number">
                        01
                    </div>

                    <div class="editwork26-section-content">

                        <span class="editwork26-label">
                            INFORMACIÓN
                        </span>

                        <h2>
                            Título de la entrega
                        </h2>

                        <p>
                            Modifica el nombre del trabajo si deseas
                            identificarlo de una forma más clara.
                        </p>

                        <div class="editwork26-field">

                            <label for="titulo">
                                Título
                            </label>

                            <input
                                    type="text"
                                    id="titulo"
                                    name="titulo"
                                    class="editwork26-input"
                                    value="<c:out value='${trabajo.titulo}'/>"
                                    required>

                        </div>

                    </div>

                </section>


                <!-- 02 -->
                <section class="editwork26-section">

                    <div class="editwork26-number">
                        02
                    </div>

                    <div class="editwork26-section-content">

                        <span class="editwork26-label">
                            DESCRIPCIÓN
                        </span>

                        <h2>
                            Información del trabajo
                        </h2>

                        <p>
                            Actualiza la descripción para explicar
                            mejor el contenido de tu evidencia.
                        </p>

                        <div class="editwork26-field">

                            <label for="descripcion">
                                Descripción
                            </label>

                            <textarea
                                    id="descripcion"
                                    name="descripcion"
                                    rows="6"
                                    class="editwork26-textarea"><c:out value="${trabajo.descripcion}"/></textarea>

                        </div>

                    </div>

                </section>


                <!-- 03 -->
                <section class="editwork26-section">

                    <div class="editwork26-number">
                        03
                    </div>

                    <div class="editwork26-section-content">

                        <span class="editwork26-label">
                            ENLACE EXTERNO
                        </span>

                        <h2>
                            GitHub, Figma, Drive o Demo
                        </h2>

                        <p>
                            Puedes reemplazar o actualizar el enlace externo
                            relacionado con esta entrega.
                        </p>

                        <div class="editwork26-field">

                            <label for="enlaceExterno">
                                Enlace
                            </label>

                            <div class="editwork26-url">

                                <span>↗</span>

                                <input
                                        type="url"
                                        id="enlaceExterno"
                                        name="enlaceExterno"
                                        class="editwork26-input"
                                        value="<c:out value='${trabajo.enlaceExterno}'/>"
                                        placeholder="https://...">

                            </div>

                        </div>

                    </div>

                </section>


                <!-- 04 -->
                <section class="editwork26-section">

                    <div class="editwork26-number">
                        04
                    </div>

                    <div class="editwork26-section-content">

                        <span class="editwork26-label">
                            ARCHIVOS ACTUALES
                        </span>

                        <h2>
                            Archivos de esta entrega
                        </h2>

                        <p>
                            Revisa los archivos ya registrados y elimina
                            solamente aquellos que ya no necesitas.
                        </p>


                        <c:choose>

                            <c:when test="${not empty trabajo.archivos}">

                                <div class="editwork26-files">

                                    <c:forEach
                                            var="a"
                                            items="${trabajo.archivos}">

                                        <div class="editwork26-file-row">

                                            <div class="editwork26-file-info">

                                                <div class="editwork26-file-icon">
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


                                            <button
                                                    type="submit"
                                                    formaction="${pageContext.request.contextPath}/estudiante/archivo/eliminar"
                                                    formmethod="post"
                                                    formenctype="application/x-www-form-urlencoded"
                                                    name="archivoId"
                                                    value="${a.id}"
                                                    class="editwork26-delete-file"
                                                    onclick="return confirm('¿Estás segura de eliminar este archivo?');">

                                                Eliminar archivo

                                            </button>

                                        </div>

                                    </c:forEach>

                                </div>

                            </c:when>


                            <c:otherwise>

                                <div class="editwork26-empty-file">

                                    <span>📂</span>

                                    <div>
                                        <strong>
                                            Sin archivos adjuntos
                                        </strong>

                                        <p>
                                            Esta entrega todavía no tiene archivos.
                                        </p>
                                    </div>

                                </div>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </section>


                <!-- 05 -->
                <section class="editwork26-section">

                    <div class="editwork26-number">
                        05
                    </div>

                    <div class="editwork26-section-content">

                        <span class="editwork26-label">
                            AGREGAR ARCHIVO
                        </span>

                        <h2>
                            Adjuntar otro archivo
                        </h2>

                        <p>
                            Si necesitas agregar una nueva evidencia,
                            puedes seleccionarla aquí.
                        </p>


                        <label class="editwork26-upload-box">

                            <div class="editwork26-upload-icon">
                                ↑
                            </div>

                            <strong>
                                Selecciona un nuevo archivo
                            </strong>

                            <span>
                                PDF, Word, ZIP o imagen
                            </span>

                            <small>
                                Haz clic aquí para buscar un archivo
                            </small>

                            <input
                                    type="file"
                                    name="archivo"
                                    accept=".pdf,.doc,.docx,.zip,.png,.jpg,.jpeg">

                        </label>

                    </div>

                </section>


                <div class="editwork26-actions">

                    <a
                            href="${pageContext.request.contextPath}/estudiante/semana?id=${trabajo.semanaId}"
                            class="editwork26-cancel">

                        ← Cancelar

                    </a>


                    <button
                            type="submit"
                            class="editwork26-submit">

                        Guardar cambios

                        <span>→</span>

                    </button>

                </div>

            </form>

        </section>


        <section class="editwork26-tip">

            <div class="editwork26-tip-icon">
                ✦
            </div>

            <div>

                <span>CONSEJO</span>

                <h3>
                    Revisa tu entrega antes de guardar
                </h3>

                <p>
                    Verifica que el título, la descripción,
                    el enlace y los archivos sean los correctos.
                </p>

            </div>

            <div class="editwork26-tip-heart">
                ♡
            </div>

        </section>

    </main>

</div>

</body>
</html>