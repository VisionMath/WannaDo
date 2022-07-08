<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="container">

	<div class="card">
		<div class="card__image card__image--river">
			<img src="${coffee.image }" width=600px>
		</div>
		<div class="card__content">
			<div class="card__title">${coffee.tastedescription}</div>
			<span><img src="${coffee.roasteryimage }" width=40px>${coffee.roastery}</span>
		</div>
	</div>
	<div>
		<ul class="list-group">
			<li class="list-group-item">${coffee.shipping }</li>
			<li class="list-group-item">${coffee.acidity }</li>
			<li class="list-group-item">${coffee.blend }</li>
			<li class="list-group-item">${coffee.roasting }</li>

		</ul>
	</div>
	<br><br>
	<div>
		<img src="${coffee.subimage1 }" width=200px> <img
			src="${coffee.subimage2 }" width=200px> <img src="${coffee.subimage3 }" width=200px>
		<h2>${coffee.roastery }</h2>
		<p>${coffee.prize }</p>
		<p>${coffee.content }</p>
		<p>${coffee.location }</p>
	</div>

	<div>
		<h2>잘 맞는 추출방법</h2>
		<p>${coffee.extraction }</p>
	</div>
	<div>
		<h2>이렇게 마시면 맛있어요</h2>
		<p>${coffee.drinkbest }</p>
	</div>
	<div>
		<h2>원두노트</h2>
		<p>${coffee.origin2 }</p>
	</div>




	<%@ include file="../includes/footer.jsp"%>
</div>