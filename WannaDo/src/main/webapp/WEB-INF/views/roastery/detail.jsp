<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="container">

	<div>
		<img src="${roastery.subimage1 }" width=300px> <img src="${roastery.subimage2 }" width=300px>
		<img src="${roastery.subimage3 }" width=300px>
		<h2>${roastery.name }</h2>
		<p>${roastery.content }</p>
		<p>${roastery.location }</p>
		<p>${roastery.instagram }</p>
		<p>${roastery.website }</p>
	</div>
	<%@ include file="../includes/footer.jsp"%>
</div>