<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/6cf589222a.js" crossorigin="anonymous"></script>

<title>WannaDo</title>
</head>
<body onload="init();" style="overflow: auto;">
	<header>
	<nav class="navbar navbar-expand-sm bg-light navbar-light justify-content-center ">
		<!-- Brand/logo -->
				
		<a class="navbar-brand" href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/images/Wanna-Do-003-removebg.png" height=60px></a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/coffee/all">All PRODUCTS</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/coffee/single">Single Origin</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/coffee/blend">Blend</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/coffee/decaffeine">DeCaffeine</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/roastery/all"> Roastery</a></li>
		</ul>
		<ul class="navbar-nav">
		<c:choose>
			<c:when test="${empty sessionScope.sUser }">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">LOGIN</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/join">JOIN</a></li>
			</c:when>
			<c:otherwise>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">LOGOUT</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage">MyPage</a></li>
			</c:otherwise>
		</c:choose>
		</ul>
	</nav>
	</header>
	
	
	
	
	
	
	
	
	