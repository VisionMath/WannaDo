<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>WannaDo</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light justify-content-center ">
		<!-- Brand/logo -->
				
		<a class="navbar-brand" href="/index"><img src="/images/Wanna-Do-003-removebg.png" height=60px></a>

		<!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/coffee/all">All PRODUCTS</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="/coffee/single">Single Origin</a></li>
			<li class="nav-item"><a class="nav-link" href="/coffee/blend"> Blend</a></li>
			<li class="nav-item"><a class="nav-link" href="/roastery"> Roastery</a></li>
		</ul>
		<ul class="navbar-nav">
		<c:choose>
			<c:when test="${empty sessionScope.sUser }">
				<li class="nav-item"><a class="nav-link" href="/login">LOGIN</a></li>
				<li class="nav-item"><a class="nav-link" href="/join">JOIN</a></li>
			</c:when>
			<c:otherwise>
				<li class="nav-item"><a class="nav-link" href="/logout">LOGOUT(${sUser.username})</a></li>
			</c:otherwise>
		</c:choose>
		</ul>
	</nav>
	
	
	
	
	
	
	
	
	