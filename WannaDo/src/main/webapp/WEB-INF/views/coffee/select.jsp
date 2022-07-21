<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<h6>Coffee Total(${count})</h6>
<ul class="cards">
	<c:forEach items="${lists.content}" var="coffee">
		<li class="cards__item">
			<div class="card" onclick="location.href='${pageContext.request.contextPath}/coffee/${coffee.id}'">
				<div class="card__image card__image--wannado">
					<img src="${coffee.image}" width=240px>
				</div>
				<div class="card__content">
					<div class="card__title">${coffee.taste}</div>
					<p class="card__text">${fn:substring(coffee.blend, 0, 19)}</p>
					<p class="card__text">${coffee.price}</p>
					<p class="card__text">${coffee.roastery}</p>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>
<div class="d-flex justify-content-between mt-3">
	<ul class="pagination">
		<c:if test="${prev==true}">
			<li class="page-item"><a class="page-link" href="list?page=${startPage-pageSize}&field=${field}&word=${word}">Previous</a></li>
		</c:if>
		<c:if test="${endPage >0}">
			<c:forEach begin="${startPage}" end="${endPage}" var="i">
				<li class="page-item"><a class="page-link" href="?page=${i}&field=${field}&word=${word}">${i+1}</a></li>
			</c:forEach>
		</c:if>
		<c:if test="${next==true}">
			<li class="page-item"><a class="page-link" href="?page=${endPage+1}&field=${field}&word=${word}">Next</a></li>
		</c:if>
	</ul>
</div>

