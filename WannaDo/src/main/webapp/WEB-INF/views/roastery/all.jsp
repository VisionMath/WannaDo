<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../includes/header.jsp"%>
<div class="container">
	<h6>Roastery Total(${count})</h6>
	<%-- <div class="form-group text-right">
		<c:if test="${not empty sessionScope.sUser }">
			<button type="button" class="btn btn-secondary btn-sm" id="btnWrite">글쓰기</button>
		</c:if>
	</div> --%>

	<ul class="cards">
		<c:forEach items="${lists.content}" var="roastery">
			<li class="cards__item">
				<div class="card" onclick="location.href='${pageContext.request.contextPath}/roastery/${roastery.id}'">
					<div class="card__image card__image--fence"><img src="${roastery.image}" width=300px></div>
					<div class="card__content">
						<div class="card__title">${roastery.name}</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	<div class="d-flex justify-content-between mt-3">
		<ul class="pagination">
			<!-- 이전 -->
			<c:if test="${prev==true}">
				<li class="page-item"><a class="page-link"
					href="list?page=${startPage-pageSize}&field=${field}&word=${word}">Previous</a></li>
			</c:if>
			<!-- 검색이 안될 때, endPage <0 보다 작은 부분 에러 처리중. -->
			<c:if test="${endPage >0}">
				<!--페이지 리스트-->
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<li class="page-item"><a class="page-link" href="?page=${i}&field=${field}&word=${word}">${i+1}</a></li>
				</c:forEach>
			</c:if>
			<!-- 검색이 안될 때, endPage <0 보다 작은 부분 에러 처리중. -->
			<!-- 다음 -->
			<c:if test="${next==true}">
				<li class="page-item"><a class="page-link"
					href="?page=${endPage+1}&field=${field}&word=${word}">Next</a></li>
			</c:if>
		</ul>

		<form class="form-inline" action="${pageContext.request.contextPath}/roastery/search" id="searchFrm">
			<select name="field" class="form-control mb-2 mr-sm-2">

				<!-- <option value="" disabled selected>--</option> -->
				<option value="title" ${ field=='title' ? 'selected' : '' }>제목</option>
				<option value="writer" ${ field=='writer' ? 'selected' : '' }>작성자</option>
				<option value="content" ${ (field=='content') ? 'selected' : '' }>내용</option>
				<option value="cwt" ${ (field=='cwt') ? 'selected' : '' }>제목or내용or작성자</option>
				<%-- <option value="" disabled selected>--</option>
				<option value="writer" ${(field=='writer') ? 'selected' : ''}>작성자</option>
				<option value="title" ${(field=='title') ? 'selected' : ''}>제목</option>
				<option value="content" ${(field=='content') ? 'selected' : ''}>내용</option>
				<option value="cwt" ${(field=='cwt') ? 'selected' : ''}>제목or작성자or내용</option> --%>
			</select> <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter Search" name="word"
				value="${word}">
			<button type="submit" class="btn btn-secondary mb-2 btn-sm">Search</button>
		</form>
	</div>
</div>

<script type="text/javascript">
	$("#btnWrite").click(function() {
		location.href = "${pageContext.request.contextPath}/roastery/register"
	});
</script>

<%@ include file="../includes/footer.jsp"%>








