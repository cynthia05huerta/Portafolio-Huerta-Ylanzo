<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         language="java" %>

<%
    request.setAttribute("pageTitle", "Portafolio Académico 2026 | Abigail");
%>

<%@ include file="fragments/header.jsp" %>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/inicio.css">


<div class="home26-page">

    <!-- =====================================================
         HEADER
         ===================================================== -->
    <header class="home26-header">

        <div class="home26-container home26-nav">

            <a href="${pageContext.request.contextPath}/inicio"
               class="home26-brand">

                <div class="home26-brand-logo">
                    <img
                            src="${pageContext.request.contextPath}/images/logo-instituto.png"
                            alt="Logo del instituto">
                </div>

                <div class="home26-brand-text">
                    <strong>Abigail</strong>
                    <span>Portafolio Académico 2026</span>
                </div>

            </a>


            <nav class="home26-menu">

                <a href="#inicio" class="active">Inicio</a>
                <a href="#sobre-mi">Sobre mí</a>
                <a href="${pageContext.request.contextPath}/semanas">Semanas</a>
                <a href="#habilidades">Habilidades</a>
                <a href="#contacto">Contacto</a>

            </nav>


            <a href="${pageContext.request.contextPath}/login"
               class="home26-login">

                Iniciar sesión
                <span>↗</span>

            </a>

        </div>

    </header>



    <main>

        <!-- =====================================================
             HERO
             ===================================================== -->
        <section id="inicio" class="home26-hero">

            <div class="home26-deco-star star-one">✦</div>
            <div class="home26-deco-star star-two">♡</div>

            <div class="home26-container home26-hero-grid">


                <!-- IZQUIERDA -->
                <div class="home26-hero-copy">

                    <div class="home26-pill">
                        <span>♡</span>
                        PORTAFOLIO ACADÉMICO 2026
                    </div>


                    <p class="home26-hello">
                        Hola, soy
                    </p>


                    <h1>
                        Abigail
                        <span>Huerta.</span>
                    </h1>


                    <div class="home26-role">
                        Diseño · Programación · Desarrollo Web
                    </div>


                    <p class="home26-description">

                        Soy estudiante de Diseño y Programación.
                        En este portafolio comparto mis actividades,
                        proyectos, aprendizajes y avances desarrollados
                        durante mi formación académica.

                    </p>


                    <div class="home26-hero-buttons">

                        <a href="${pageContext.request.contextPath}/semanas"
                           class="home26-btn-primary">

                            Ver mis semanas
                            <span>→</span>

                        </a>


                        <a href="#sobre-mi"
                           class="home26-btn-secondary">

                            Conocerme

                        </a>

                    </div>


                    <div class="home26-social-mini">

                        <span>ENCUÉNTRAME</span>

                        <div>
                            <a href="#" aria-label="Facebook">f</a>
                            <a href="#" aria-label="Instagram">◎</a>
                            <a href="#" aria-label="TikTok">♪</a>
                            <a href="#" aria-label="WhatsApp">◌</a>
                        </div>

                    </div>

                </div>



                <!-- DERECHA -->
                <div class="home26-visual">

                    <div class="home26-bg-circle"></div>

                    <!-- ILUSTRACIÓN PRINCIPAL -->
                    <div class="home26-photo-card home26-illustration-card">

                        <img
                                src="${pageContext.request.contextPath}/images/chica-portafolio.jpeg"
                                alt="Ilustración de estudiante programando">

                    </div>


                    <div class="home26-note note-top">

                        <span>PLAN</span>
                        <strong>Aprender</strong>
                        <strong>Crear</strong>
                        <strong>Mejorar</strong>

                        <small>♡</small>

                    </div>


                    <div class="home26-note note-bottom">

                        <span>2026</span>

                        <strong>
                            Nuevos proyectos
                        </strong>

                    </div>


                    <div class="home26-plant">

                        <span class="home26-stem"></span>

                        <i class="leaf l1"></i>
                        <i class="leaf l2"></i>
                        <i class="leaf l3"></i>
                        <i class="leaf l4"></i>

                    </div>

                </div>

            </div>

        </section>



        <!-- =====================================================
             QUÉ HAGO
             ===================================================== -->
        <section class="home26-services">

            <div class="home26-container">

                <div class="home26-services-card">


                    <div class="home26-services-intro">

                        <span class="home26-mini-title">
                            LO QUE APRENDO ♡
                        </span>

                        <h2>
                            Creo y desarrollo
                            soluciones digitales.
                        </h2>

                    </div>


                    <article class="home26-service">

                        <div class="home26-service-icon lavender">
                            &lt;/&gt;
                        </div>

                        <h3>Desarrollo Web</h3>

                        <p>
                            Creo interfaces y páginas web
                            organizadas, funcionales y responsivas.
                        </p>

                    </article>


                    <article class="home26-service">

                        <div class="home26-service-icon rose">
                            ✦
                        </div>

                        <h3>Diseño UI/UX</h3>

                        <p>
                            Diseño interfaces visuales sencillas,
                            agradables y fáciles de utilizar.
                        </p>

                    </article>


                    <article class="home26-service">

                        <div class="home26-service-icon sage">
                            ◫
                        </div>

                        <h3>Bases de Datos</h3>

                        <p>
                            Organizo y gestiono información mediante
                            bases de datos y sistemas web.
                        </p>

                    </article>


                    <article class="home26-service">

                        <div class="home26-service-icon peach">
                            ♡
                        </div>

                        <h3>Creatividad</h3>

                        <p>
                            Busco combinar programación, diseño
                            y creatividad en cada proyecto.
                        </p>

                    </article>

                </div>

            </div>

        </section>



        <!-- =====================================================
             SOBRE MÍ
             ===================================================== -->
        <section id="sobre-mi"
                 class="home26-section home26-about">

            <div class="home26-container">


                <div class="home26-section-top">

                    <div>
                        <span>01</span>
                        <small>SOBRE MÍ</small>
                    </div>

                    <h2>
                        Conoce un poco
                        <em>más sobre mí.</em>
                    </h2>

                </div>



                <div class="home26-about-grid">


                    <div class="home26-about-photo">

                        <img
                                src="${pageContext.request.contextPath}/images/perfil.jpeg"
                                alt="Foto de Abigail">

                        <div class="home26-about-badge">
                            ♡ Abigail · 2026
                        </div>

                    </div>



                    <div class="home26-about-content">

                        <span class="home26-mini-title">
                            MI HISTORIA
                        </span>


                        <h3>
                            Aprender, practicar
                            y transformar ideas
                            en proyectos.
                        </h3>


                        <p>
                            Soy estudiante de Diseño y Programación
                            y me interesa desarrollar soluciones
                            digitales funcionales, visualmente agradables
                            y fáciles de utilizar.
                        </p>


                        <p>
                            Durante mi formación voy fortaleciendo mis
                            conocimientos en programación, desarrollo web,
                            bases de datos, análisis de sistemas y
                            diseño de interfaces.
                        </p>


                        <div class="home26-about-tags">

                            <span>Desarrollo Web</span>
                            <span>Diseño UI/UX</span>
                            <span>Bases de Datos</span>
                            <span>Creatividad Digital</span>

                        </div>

                    </div>

                </div>

            </div>

        </section>



        <!-- =====================================================
             SEMANAS
             ===================================================== -->
        <section class="home26-section home26-projects">

            <div class="home26-container">


                <div class="home26-section-top">

                    <div>
                        <span>02</span>
                        <small>MIS SEMANAS</small>
                    </div>

                    <h2>
                        Mis trabajos
                        <em>académicos.</em>
                    </h2>

                </div>



                <div class="home26-project-grid">


                    <article class="home26-project-card project-one">

                        <div class="home26-project-preview">

                            <div class="home26-project-browser">

                                <span></span>
                                <span></span>
                                <span></span>

                            </div>

                            <strong>01</strong>

                            <div class="home26-project-art">
                                &lt;/&gt;
                            </div>

                        </div>


                        <div class="home26-project-info">

                            <div>

                                <span>SEMANA 01</span>

                                <h3>
                                    Primera actividad académica
                                </h3>

                                <p>
                                    Evidencias y actividades desarrolladas
                                    durante la primera semana.
                                </p>

                            </div>

                            <a href="${pageContext.request.contextPath}/semanas">
                                ↗
                            </a>

                        </div>

                    </article>



                    <article class="home26-project-card project-two">

                        <div class="home26-project-preview">

                            <div class="home26-project-browser">

                                <span></span>
                                <span></span>
                                <span></span>

                            </div>

                            <strong>02</strong>

                            <div class="home26-project-art">
                                ✦
                            </div>

                        </div>


                        <div class="home26-project-info">

                            <div>

                                <span>SEMANA 02</span>

                                <h3>
                                    Desarrollo y aprendizaje
                                </h3>

                                <p>
                                    Actividades correspondientes
                                    al desarrollo de nuevos conocimientos.
                                </p>

                            </div>

                            <a href="${pageContext.request.contextPath}/semanas">
                                ↗
                            </a>

                        </div>

                    </article>



                    <article class="home26-project-card project-three">

                        <div class="home26-project-preview">

                            <div class="home26-project-browser">

                                <span></span>
                                <span></span>
                                <span></span>

                            </div>

                            <strong>03</strong>

                            <div class="home26-project-art">
                                ◫
                            </div>

                        </div>


                        <div class="home26-project-info">

                            <div>

                                <span>SEMANA 03</span>

                                <h3>
                                    Proyecto académico
                                </h3>

                                <p>
                                    Proyectos, ejercicios y evidencias
                                    correspondientes al curso.
                                </p>

                            </div>

                            <a href="${pageContext.request.contextPath}/semanas">
                                ↗
                            </a>

                        </div>

                    </article>

                </div>



                <div class="home26-project-all">

                    <a href="${pageContext.request.contextPath}/semanas">

                        Ver todas las semanas

                        <span>→</span>

                    </a>

                </div>

            </div>

        </section>



        <!-- =====================================================
             HABILIDADES
             ===================================================== -->
        <section id="habilidades"
                 class="home26-section home26-skills">

            <div class="home26-container">


                <div class="home26-section-top">

                    <div>
                        <span>03</span>
                        <small>HABILIDADES</small>
                    </div>

                    <h2>
                        Tecnologías que
                        <em>voy aprendiendo.</em>
                    </h2>

                </div>



                <div class="home26-skills-grid">


                    <article class="home26-skill">

                        <div class="home26-skill-image lavender">
                            <img src="${pageContext.request.contextPath}/images/skills/html.png"
                                 alt="HTML5">
                        </div>

                        <span>01</span>
                        <h3>HTML5</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image blue">
                            <img src="${pageContext.request.contextPath}/images/skills/css.png"
                                 alt="CSS3">
                        </div>

                        <span>02</span>
                        <h3>CSS3</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image yellow">
                            <img src="${pageContext.request.contextPath}/images/skills/javascript.png"
                                 alt="JavaScript">
                        </div>

                        <span>03</span>
                        <h3>JavaScript</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image rose">
                            <img src="${pageContext.request.contextPath}/images/skills/php.png"
                                 alt="PHP">
                        </div>

                        <span>04</span>
                        <h3>PHP</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image peach">
                            <img src="${pageContext.request.contextPath}/images/skills/java.png"
                                 alt="Java">
                        </div>

                        <span>05</span>
                        <h3>Java</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image blue">
                            <img src="${pageContext.request.contextPath}/images/skills/mysql.png"
                                 alt="MySQL">
                        </div>

                        <span>06</span>
                        <h3>MySQL</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image rose">
                            <img src="${pageContext.request.contextPath}/images/skills/jsp.png"
                                 alt="JSP">
                        </div>

                        <span>07</span>
                        <h3>JSP</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image sage">
                            <img src="${pageContext.request.contextPath}/images/skills/spring.png"
                                 alt="Spring MVC">
                        </div>

                        <span>08</span>
                        <h3>Spring MVC</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image lavender">
                            <img src="${pageContext.request.contextPath}/images/skills/github.png"
                                 alt="GitHub">
                        </div>

                        <span>09</span>
                        <h3>GitHub</h3>

                    </article>


                    <article class="home26-skill">

                        <div class="home26-skill-image peach">
                            <img src="${pageContext.request.contextPath}/images/skills/uiux.png"
                                 alt="Diseño UI UX">
                        </div>

                        <span>10</span>
                        <h3>Diseño UI/UX</h3>

                    </article>

                </div>

            </div>

        </section>



        <!-- =====================================================
             CONTACTO
             ===================================================== -->
        <section id="contacto"
                 class="home26-section home26-contact">

            <div class="home26-container">


                <div class="home26-contact-box">


                    <div class="home26-contact-copy">

                        <span class="home26-mini-title">
                            04 · CONTACTO ♡
                        </span>

                        <h2>
                            Sigamos
                            <em>conectados.</em>
                        </h2>

                        <p>
                            Puedes encontrarme en mis redes sociales
                            y conocer más sobre mis actividades,
                            proyectos y aprendizaje.
                        </p>

                    </div>


                    <div class="home26-contact-links">

                        <a href="https://www.facebook.com/cynthia.abigail.613959" target="_blank">
                            <span>01</span>
                            Facebook
                            <b>↗</b>
                        </a>


                        <a href="https://www.instagram.com/cynthiaabigail05?stkn=MTNmNDk4a3oyaDZnMA%3D%3D">
                            <span>02</span>
                            Instagram
                            <b>↗</b>
                        </a>

                        <a href="https://www.tiktok.com/@abigail_1408?_r=1&_t=ZS-99woUUK8GXM">
                            <span>03</span>
                            TikTok
                            <b>↗</b>
                        </a>

                        <a href="https://web.whatsapp.com/">
                            <span>04</span>
                            WhatsApp
                            <b>↗</b>
                        </a>

                    </div>


                    <div class="home26-contact-decoration">
                        ♡
                    </div>

                </div>

            </div>

        </section>

    </main>



    <!-- =====================================================
         FOOTER
         ===================================================== -->
    <footer class="home26-footer">

        <div class="home26-container">

            <strong>Abigail.</strong>

            <p>
                © 2026 · Portafolio Académico
            </p>

            <a href="#inicio">
                ↑ Volver arriba
            </a>

        </div>

    </footer>

</div>


</body>
</html>