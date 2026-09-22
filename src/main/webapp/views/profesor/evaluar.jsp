<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Evaluar | Docente"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/profesor-evaluar.css?v=1">


<div class="cpanel-layout teacher-evaluate-page">


    <!-- =========================
         CONTENIDO
    ========================== -->
    <main class="cpanel-main">

        <!-- HERO -->
        <header class="evaluate-hero">

            <div class="evaluate-hero-copy">

                <span class="cpanel-eyebrow">
                    EVALUACIÓN DOCENTE
                </span>

                <h1>
                    <c:choose>
                        <c:when test="${not empty evaluacion}">
                            Editar evaluación
                        </c:when>

                        <c:otherwise>
                            Evaluar trabajo
                        </c:otherwise>
                    </c:choose>
                </h1>

                <p>
                    Revisa la evidencia presentada y registra una
                    calificación junto con una retroalimentación para
                    el estudiante.
                </p>

            </div>

            <div class="evaluate-hero-decoration">

                <div class="decoration-circle circle-one"></div>
                <div class="decoration-circle circle-two"></div>

                <div class="hero-mini-card">
                    <span>CALIFICACIÓN</span>
                    <strong>0 — 20</strong>
                    <small>Escala de evaluación</small>
                </div>

            </div>

        </header>


        <!-- MENSAJE ERROR -->
        <c:if test="${not empty sessionScope.flashError}">

            <div class="evaluate-alert evaluate-alert-error">

                <div class="alert-symbol">!</div>

                <div>
                    <strong>No se pudo guardar la evaluación</strong>

                    <p>
                        <c:out value="${sessionScope.flashError}"/>
                    </p>
                </div>

            </div>

            <c:remove var="flashError" scope="session"/>

        </c:if>


        <!-- YA EVALUADO -->
        <c:if test="${not empty evaluacion}">

            <div class="evaluate-alert evaluate-alert-info">

                <div class="alert-symbol">✓</div>

                <div>
                    <strong>Esta entrega ya fue evaluada</strong>

                    <p>
                        Puedes modificar la nota o actualizar
                        la retroalimentación registrada.
                    </p>
                </div>

            </div>

        </c:if>


        <div class="evaluate-layout">

            <!-- =========================
                 ENTREGA DEL ESTUDIANTE
            ========================== -->
            <section class="evaluate-work-card">

                <div class="evaluate-work-header">

                    <div>

                        <span class="evaluate-small-label">
                            ENTREGA DEL ESTUDIANTE
                        </span>

                        <h2>
                            <c:out value="${trabajo.titulo}"/>
                        </h2>

                    </div>

                    <div class="work-status">
                        Recibido
                    </div>

                </div>


                <div class="evaluate-description">

                    <span class="evaluate-section-label">
                        DESCRIPCIÓN
                    </span>

                    <p>
                        <c:choose>

                            <c:when test="${not empty trabajo.descripcion}">
                                <c:out value="${trabajo.descripcion}"/>
                            </c:when>

                            <c:otherwise>
                                Sin descripción registrada.
                            </c:otherwise>

                        </c:choose>
                    </p>

                </div>


                <!-- ARCHIVOS -->
                <div class="evaluate-files-section">

                    <div class="section-heading-row">

                        <span class="evaluate-section-label">
                            ARCHIVOS ADJUNTOS
                        </span>

                        <span class="section-line"></span>

                    </div>


                    <c:choose>

                        <c:when test="${not empty trabajo.archivos}">

                            <div class="evaluate-files-list">

                                <c:forEach
                                        var="a"
                                        items="${trabajo.archivos}">

                                    <div class="evaluate-file-row">

                                        <div class="evaluate-file-main">

                                            <div class="evaluate-file-icon">
                                                ↓
                                            </div>

                                            <div class="evaluate-file-info">

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
                                                class="evaluate-download-btn">

                                            Descargar

                                            <span>↓</span>

                                        </a>

                                    </div>

                                </c:forEach>

                            </div>

                        </c:when>


                        <c:otherwise>

                            <div class="evaluate-empty-file">
                                Esta entrega no contiene archivos adjuntos.
                            </div>

                        </c:otherwise>

                    </c:choose>

                </div>


                <!-- ENLACE -->
                <c:if test="${not empty trabajo.enlaceExterno}">

                    <div class="evaluate-external-section">

                        <span class="evaluate-section-label">
                            ENLACE EXTERNO
                        </span>

                        <a
                                href="${trabajo.enlaceExterno}"
                                target="_blank"
                                rel="noopener noreferrer"
                                class="evaluate-external-link">

                            <span class="external-icon">↗</span>

                            <div>
                                <strong>Abrir recurso externo</strong>
                                <small>GitHub, Drive, Figma o demostración</small>
                            </div>

                            <b>→</b>

                        </a>

                    </div>

                </c:if>

            </section>


            <!-- =========================
                 FORMULARIO EVALUACIÓN
            ========================== -->
            <section class="evaluate-form-card">

                <div class="evaluate-form-heading">

                    <span class="evaluate-small-label">
                        REGISTRO DOCENTE
                    </span>

                    <h2>
                        Calificación
                    </h2>

                    <p>
                        Asigna una nota y escribe una
                        retroalimentación clara para el estudiante.
                    </p>

                </div>


                <form
                        method="post"
                        action="${pageContext.request.contextPath}/profesor/evaluar"
                        class="evaluate-form">

                    <input
                            type="hidden"
                            name="trabajoId"
                            value="${trabajo.id}">


                    <!-- NOTA -->
                    <div class="evaluate-field">

                        <div class="evaluate-field-heading">

                            <div>
                                <span class="field-number">
                                    01
                                </span>

                                <div>
                                    <label for="nota">
                                        Nota obtenida
                                    </label>

                                    <small>
                                        Valor entre 0 y 20
                                    </small>
                                </div>
                            </div>

                        </div>


                        <div class="grade-input-wrapper">

                            <input
                                    id="nota"
                                    type="number"
                                    name="nota"
                                    min="0"
                                    max="20"
                                    step="0.1"
                                    value="<c:out value='${evaluacion.nota}'/>"
                                    placeholder="18"
                                    required>

                            <span>/ 20</span>

                        </div>

                    </div>


                    <div class="evaluate-divider"></div>


                    <!-- COMENTARIO -->
                    <div class="evaluate-field">

                        <div class="evaluate-field-heading">

                            <div>

                                <span class="field-number">
                                    02
                                </span>

                                <div>
                                    <label for="comentario">
                                        Retroalimentación
                                    </label>

                                    <small>
                                        Comentario para el estudiante
                                    </small>
                                </div>

                            </div>

                        </div>


                        <textarea
                                id="comentario"
                                name="comentario"
                                rows="7"
                                placeholder="Escribe aquí tus observaciones, recomendaciones o felicitaciones..."><c:out value="${evaluacion.contenido}"/></textarea>

                        <p class="evaluate-helper">
                            Procura que tu comentario sea claro,
                            específico y relacionado con el trabajo presentado.
                        </p>

                    </div>


                    <!-- BOTONES -->
                    <div class="evaluate-actions">

                        <a
                                href="${pageContext.request.contextPath}/profesor/semana?id=${trabajo.semanaId}"
                                class="evaluate-cancel-btn">

                            ← Cancelar

                        </a>


                        <button
                                type="submit"
                                class="evaluate-submit-btn">

                            <c:choose>

                                <c:when test="${not empty evaluacion}">
                                    Actualizar evaluación
                                </c:when>

                                <c:otherwise>
                                    Guardar evaluación
                                </c:otherwise>

                            </c:choose>

                            <span>→</span>

                        </button>

                    </div>

                </form>

            </section>

        </div>

    </main>

</div>

</body>
</html>