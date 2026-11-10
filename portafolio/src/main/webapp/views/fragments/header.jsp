<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>
        ${empty pageTitle ? 'Portafolio Académico | Abigail' : pageTitle}
    </title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css?v=20260902-cpanel">
</head>

<body>