<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<%
    request.setAttribute(
            "pageTitle",
            "Editar semana | Abigail"
    );
%>

<%@ include file="../fragments/header.jsp" %>

<!-- CSS EXCLUSIVO DE EDITAR SEMANA -->
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/estudiante-editar-semana.css">


<div class="cpanel-layout edit-week-page">

    <!-- =====================================================
         SIDEBAR
         ===================================================== -->

    <aside class="cpanel-sidebar">

        <div class="cpanel-brand">

            <div class="cpanel-brand-icon">
                A
            </div>

            <div>
                <strong>Abigail.</strong>
                <span>Portafolio Académico</span>
            </div>

        </div>


        <nav class="cpanel-menu">

            <a href="${pageContext.request.contextPath}/estudiante/dashboard"
               class="cpanel-menu-item">

                <span>⌂</span>
                <b>Dashboard</b>

            </a>


            <a href="${pageContext.request.contextPath}/estudiante/semanas"
               class="cpanel-menu-item active">

                <span>▣</span>
                <b>Mis semanas</b>

            </a>


            <a href="${pageContext.request.contextPath}/estudiante/nueva-entrega"
               class="cpanel-menu-item">

                <span>↑</span>
                <b>Subir entrega</b>

            </a>


            <a href="${pageContext.request.contextPath}/estudiante/evaluaciones"
               class="cpanel-menu-item">

                <span>☆</span>
                <b>Evaluaciones</b>

            </a>


            <div class="cpanel-menu-divider"></div>


            <a href="${pageContext.request.contextPath}/inicio"
               class="cpanel-menu-item">

                <span>◎</span>
                <b>Ver portafolio</b>

            </a>


            <a href="${pageContext.request.contextPath}/logout"
               class="cpanel-menu-item logout">

                <span>↩</span>
                <b>Cerrar sesión</b>

            </a>

        </nav>

    </aside>


    <!-- =====================================================
         CONTENIDO
         ===================================================== -->

    <main class="cpanel-main">


        <!-- CABECERA -->

        <header class="cpanel-topbar">

            <div>

                <span class="cpanel-eyebrow">
                    ADMINISTRAR SEMANA
                </span>

                <h1>
                    Editar semana
                </h1>

                <p>
                    Actualiza la información de esta semana
                    y mantén organizado tu portafolio académico.
                </p>

            </div>

        </header>


        <!-- =================================================
             MENSAJE DE ERROR
             ================================================= -->

        <c:if test="${not empty sessionScope.flashError}">

            <div class="edit-alert error">

                <strong>
                    <c:out value="${sessionScope.flashError}"/>
                </strong>

            </div>

            <c:remove
                    var="flashError"
                    scope="session"/>

        </c:if>


        <!-- =================================================
             FORMULARIO
             ================================================= -->

        <section class="delivery-panel">

            <form
                    method="post"
                    action="${pageContext.request.contextPath}/estudiante/semana/editar"
                    class="delivery-form">


                <!-- ID OCULTO -->

                <input
                        type="hidden"
                        name="id"
                        value="${semana.id}">


                <!-- =========================================
                     01 - NÚMERO
                     ========================================= -->

                <div class="delivery-section">

                    <span class="cpanel-eyebrow">
                        SEMANA
                    </span>

                    <h3>
                        Número de semana
                    </h3>

                    <input
                            type="number"
                            name="numero"
                            class="delivery-input"
                            min="1"
                            value="${semana.numero}"
                            required>

                </div>


                <div class="delivery-divider"></div>


                <!-- =========================================
                     02 - TÍTULO
                     ========================================= -->

                <div class="delivery-section">

                    <span class="cpanel-eyebrow">
                        INFORMACIÓN
                    </span>

                    <h3>
                        Nombre de la semana
                    </h3>

                    <input
                            type="text"
                            name="titulo"
                            class="delivery-input"
                            maxlength="255"
                            value="<c:out value='${semana.titulo}'/>"
                            placeholder="Ej. Introducción a Spring MVC"
                            required>

                </div>


                <div class="delivery-divider"></div>


                <!-- =========================================
                     03 - DESCRIPCIÓN
                     ========================================= -->

                <div class="delivery-section">

                    <span class="cpanel-eyebrow">
                        DESCRIPCIÓN
                    </span>

                    <h3>
                        Temas desarrollados
                    </h3>

                    <textarea
                            name="descripcion"
                            class="delivery-textarea"
                            rows="6"
                            placeholder="Describe los temas desarrollados durante esta semana..."><c:out value="${semana.descripcion}"/></textarea>

                </div>


                <!-- =========================================
                     BOTONES
                     ========================================= -->

                <div class="delivery-actions">

                    <a
                            href="${pageContext.request.contextPath}/estudiante/semanas"
                            class="week-action-secondary">

                        ← Cancelar

                    </a>


                    <button
                            type="submit"
                            class="btn-primary">

                        ✓ Guardar cambios

                    </button>

                </div>

            </form>

        </section>

    </main>

</div>

</body>
</html>