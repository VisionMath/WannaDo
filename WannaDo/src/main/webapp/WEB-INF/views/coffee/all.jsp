<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../includes/header.jsp"%>
<div class="container" style="width: 100%">
	<div class="wrapper">
		<div class="sidebar" style="width: 25%">
			<div class="style_selects">
				<a class="style_select">달콤</a>
				<a class="style_select">고소</a>
				<a class="style_select">상큼</a>
				<a class="style_select">쌉쌀</a>
				<a class="style_select">밸런스</a>
				<a class="style_select">깔끔한</a>
				<a class="style_select">부드러운</a>
				<a class="style_select">묵직한</a>
				<a class="style_select">과일</a>
				<a class="style_select">꽃향기</a>
				<a class="style_select">초콜릿</a>
				<a class="style_select">견과류</a>
				<a class="style_select">스모키</a>
				<a class="style_select">허브</a>
				<a class="style_select">시나몬</a>
				<a class="style_select">긴여운</a>
				<a class="style_select">풍부한</a>
				<a class="style_select">은은한</a>
				<a class="style_select">화사한</a>
			</div>
		</div>
		<div class="main">
			<h6>Coffee Total(${count})</h6>
			<ul class="cards">
				<c:forEach items="${lists.content}" var="coffee">
					<li class="cards__item">
						<div class="card"
							onclick="location.href='${pageContext.request.contextPath}/coffee/${coffee.id}'">
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

				<form class="form-inline" action="${pageContext.request.contextPath}/coffee/search"
					id="searchFrm">
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
	</div>
	<%@ include file="../includes/footer.jsp"%>
</div>

<script type="text/javascript" src="../js/select.js"></script>

<style type="text/css">
.style_select {
	margin: 0 8px 8px 0;
	padding: 10px 12px;
	border: 1px solid #ebe6d4;
	border-radius: 2px;
	box-sizing: border-box;
	font-weight: 500;
	font-size: 15px;
	line-height: 21px;
	letter-spacing: -.3px;
	color: #212121;
	text-decoration: none !important
}

.style_active {
	background-color: #fffdf9;
	border-color: #ffaa9f;
}

.style_selects {
	display: flex;
	flex-wrap: wrap;
	padding-bottom: 16px;
}
</style>