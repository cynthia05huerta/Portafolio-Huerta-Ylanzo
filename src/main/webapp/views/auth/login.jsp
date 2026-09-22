<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>
        Iniciar sesión | Portafolio Académico
    </title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css?v=20">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/login.css?v=1">

</head>


<body class="login26-body">


<div class="login26-page">


    <!-- =====================================================
         PANEL IZQUIERDO DECORATIVO
         ===================================================== -->
    <section class="login26-visual">

        <div class="login26-shape shape-one"></div>
        <div class="login26-shape shape-two"></div>

        <span class="login26-star star-one">✦</span>
        <span class="login26-star star-two">♡</span>


        <div class="login26-visual-content">

            <div class="login26-brand">

                <div class="login26-logo">

                    <img
                            src="${pageContext.request.contextPath}/images/logo-instituto.png"
                            alt="Logo del instituto">

                </div>


                <div>

                    <strong>
                        Abigail
                    </strong>

                    <span>
                        Portafolio Académico 2026
                    </span>

                </div>

            </div>


            <div class="login26-message">

                <span>
                    ÁREA ACADÉMICA ♡
                </span>

                <h2>
                    Aprende.
                    <br>
                    Crea.
                    <br>
                    <em>Avanza.</em>
                </h2>

                <p>
                    Accede a tu espacio académico para gestionar,
                    revisar y continuar tu proceso de aprendizaje.
                </p>

            </div>


            <div class="login26-illustration">

                <div class="login26-circle"></div>

                <div class="login26-laptop">

                    <div class="login26-screen">

                        <span>
                            &lt;/&gt;
                        </span>

                        <small>
                            PORTAFOLIO
                        </small>

                    </div>

                    <div class="login26-base"></div>

                </div>


                <div class="login26-note">

                    <span>
                        2026
                    </span>

                    <strong>
                        Diseña
                    </strong>

                    <strong>
                        Programa
                    </strong>

                    <strong>
                        Mejora
                    </strong>

                    <small>
                        ♡
                    </small>

                </div>

            </div>

        </div>

    </section>



    <!-- =====================================================
         LOGIN
         ===================================================== -->
    <section class="login26-form-side">


        <div class="login26-card">


            <!-- CABECERA -->
            <div class="login26-heading">

                <span>
                    BIENVENIDA ♡
                </span>

                <h1>
                    Iniciar sesión
                </h1>

                <p>
                    Ingresa tus datos y selecciona el tipo de usuario
                    con el que deseas acceder.
                </p>

            </div>



            <!-- ERROR -->
            <c:if test="${not empty error}">

                <div class="login26-error">

                    <div class="login26-error-icon">
                        !
                    </div>

                    <div>

                        <strong>
                            No se pudo iniciar sesión
                        </strong>

                        <p>
                            <c:out value="${error}"/>
                        </p>

                    </div>

                </div>

            </c:if>



            <!-- FORMULARIO -->
            <form
                    method="post"
                    action="${pageContext.request.contextPath}/login"
                    id="loginForm"
                    class="login26-form">


                <input
                        type="hidden"
                        name="tipoUsuario"
                        id="tipoUsuario"
                        value="${tipoSeleccionado == 'profesor'
                                ? 'profesor'
                                : 'estudiante'}">



                <!-- CORREO -->
                <div class="login26-field">

                    <label for="correo">
                        Correo electrónico
                    </label>

                    <div class="login26-input-wrap">

                        <span class="login26-input-icon">
                            @
                        </span>

                        <input
                                type="email"
                                id="correo"
                                name="correo"
                                value="<c:out value='${correoIngresado}'/>"
                                placeholder="nombre@correo.com"
                                autocomplete="email"
                                required>

                    </div>

                </div>



                <!-- CONTRASEÑA -->
                <div class="login26-field">

                    <label for="password">
                        Contraseña
                    </label>

                    <div class="login26-input-wrap">

                        <span class="login26-input-icon">
                            ✦
                        </span>

                        <input
                                type="password"
                                id="password"
                                name="password"
                                placeholder="••••••••••"
                                autocomplete="current-password"
                                required>

                    </div>

                </div>



                <!-- ROL -->
                <div class="login26-field">

                    <label>
                        Ingresar como
                    </label>


                    <div class="login26-role-grid">


                        <!-- ESTUDIANTE -->
                        <button
                                type="button"
                                id="btnEstudiante"
                                class="login26-role-card
                                ${tipoSeleccionado == 'profesor'
                                ? ''
                                : 'active'}"
                                onclick="seleccionarRol('estudiante')">

                            <div class="login26-role-icon student">
                                👩‍🎓
                            </div>

                            <div>

                                <strong>
                                    Estudiante
                                </strong>

                                <small>
                                    Subir y consultar entregas
                                </small>

                            </div>

                            <span class="login26-role-check">
                                ✓
                            </span>

                        </button>



                        <!-- DOCENTE -->
                        <button
                                type="button"
                                id="btnProfesor"
                                class="login26-role-card
                                ${tipoSeleccionado == 'profesor'
                                ? 'active'
                                : ''}"
                                onclick="seleccionarRol('profesor')">

                            <div class="login26-role-icon teacher">
                                👩‍🏫
                            </div>

                            <div>

                                <strong>
                                    Docente
                                </strong>

                                <small>
                                    Revisar y evaluar trabajos
                                </small>

                            </div>

                            <span class="login26-role-check">
                                ✓
                            </span>

                        </button>

                    </div>

                </div>



                <!-- BOTÓN -->
                <button
                        type="submit"
                        class="login26-submit">

                    Iniciar sesión

                    <span>
                        →
                    </span>

                </button>

            </form>



            <a
                    href="${pageContext.request.contextPath}/inicio"
                    class="login26-back">

                ← Volver al portafolio

            </a>


            <div class="login26-small-note">

                <span>♡</span>

                Acceso exclusivo para usuarios registrados.

            </div>

        </div>

    </section>

</div>



<script>

    function seleccionarRol(rol) {

        const campoRol =
            document.getElementById("tipoUsuario");

        const botonEstudiante =
            document.getElementById("btnEstudiante");

        const botonProfesor =
            document.getElementById("btnProfesor");


        campoRol.value = rol;


        botonEstudiante
            .classList
            .remove("active");


        botonProfesor
            .classList
            .remove("active");


        if (rol === "estudiante") {

            botonEstudiante
                .classList
                .add("active");

        } else {

            botonProfesor
                .classList
                .add("active");
        }
    }

</script>


</body>

</html>