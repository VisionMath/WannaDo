<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../includes/header.jsp"%>

<script>
	function init() {
		var extration = $('#extraction').val();
		var drinkbest = $('#drinkbest').val();
		
		var extArray = [ '커피메이커', '핸드드립', '에스프레소머신', '모카포트', '프렌치프레스',
				'에어로프레스', '콜드브루' ];
		var svgArray = [ 'coffeeMaker.svg', 'handDrip.svg', 'espreso.svg',
				'mocapot.svg', 'frenchpress.svg', 'aeropress.svg',
				'coldbrew.svg' ]
		
		var drinkArray = ['블랙 그대로', '우유 넣은 라떼', '설탕을 넣은 커피', '시럽을 넣은 커피'];
		var drinkSVG = ['black.svg', 'milk.svg', 'sugar.svg', 'syrup.svg'];

		var split = extraction.value.split("BEST", 2);
		var bestPos = extArray.indexOf(split[0]);

		$('#ext')
				.append(
						"<li class='style_float'><div class='style_wrapper'><img src='${pageContext.request.contextPath}/images/svg/"+svgArray[bestPos]+"' width='80' height='80'><span class='style_label'>"+split[0]+"</span></div></li>");
		for (var i=0; i<extArray.length;i++) {
			if (split[1].includes(extArray[i])) {
				$('#ext')
				.append(
						"<li class='style_float'><div class='style_wrapper'><img src='${pageContext.request.contextPath}/images/svg/"+svgArray[i]+"' width='80' height='80'><span class='style_label'>"+extArray[i]+"</span></div></li>");				
			}
		}
		
		for (var i=0; i<drinkArray.length;i++) {
			if (drinkbest.includes(drinkArray[i])) {
				$('#drink')
				.append(
						"<li class='style_float'><div class='style_wrapper'><img src='${pageContext.request.contextPath}/images/svg/"+drinkSVG[i]+"' width='80' height='80'><span class='style_label'>"+drinkArray[i]+"</span></div></li>");				
			}
		}
	}
</script>

<div class="container">
	<div class="wrapper">
		<div class="main">
			<div class="card">
				<div class="card__image card__image--river">
					<img src="${coffee.image }" height=500px>
				</div>
				<div class="card__content">
					<div class="card__title" style="text-align: left;">${coffee.tastedescription}</div>
					<span>
						<img src="${coffee.roasteryimage }" width=40px>${coffee.roastery}</span>
				</div>
			</div>
			<div>
				<ul class="list-group">
					<li class="list-group-item"><span>
							<img src="${pageContext.request.contextPath}/images/svg/shipping.svg">
						</span> &nbsp;${coffee.shipping }&nbsp;3일 내 볶은 원두만 배송합니다.</li>
					<c:set var="acidity" value='${coffee.acidity}' />
					<li class="list-group-item"><span>
							<img src="${pageContext.request.contextPath}/images/svg/acidity.svg">
						</span>&nbsp;${fn:replace(acidity, '?', ' ')}</li>
					<li class="list-group-item"><span>
							<img src="${pageContext.request.contextPath}/images/svg/blend.svg">
						</span>&nbsp;${coffee.blend }</li>
					<li class="list-group-item"><span>
							<img src="${pageContext.request.contextPath}/images/svg/roasting.svg">
						</span>&nbsp;${coffee.roasting }</li>
				</ul>
			</div>
			<br> <br>
			<div>
				<img src="${coffee.subimage1 }" width=200px> <img src="${coffee.subimage2 }" width=200px>
				<img src="${coffee.subimage3 }" width=200px> <br> <br>
				<h2 class="style_title">${coffee.roastery }</h2>
				<c:set var="prize" value="${coffee.prize }" />
				<c:set var="str" value="${fn:replace(prize, '20', '<br>20') }" />
				<p>${str }</p>
				<p class="style_introduce">${coffee.content }</p>
				<c:set var="info" value="${coffee.location }" />
				<c:set var="instaPos" value="${fn:indexOf(info, 'Instagram')}" />
				<c:set var="webPos" value="${fn:indexOf(info, 'Website')}" />
				<c:set var="location" value="${fn:substring(info, 2, instaPos)}" />
				<c:set var="instagram" value="${fn:substring(info, instaPos+9, webPos)}" />
				<ul class="style_links">
					<li><a class="style_link" href="https://map.naver.com/v5/search/${location }"
							target="_blank" rel="noreferrer" style="text-decoration: none;">
							<img src="${pageContext.request.contextPath}/images/svg/location.svg">
							<span class="style_address">
								${location }&nbsp;
								<img src="${pageContext.request.contextPath}/images/svg/link.svg">
							</span>
						</a></li>
					<li><a class="style_link" href="https://www.instagram.com/${instagram }" target="_blank"
							rel="noreferrer" style="text-decoration: none;">
							<img src="${pageContext.request.contextPath}/images/svg/instagram.svg">
							<span class="style_address">
								${instagram }&nbsp;
								<img src="${pageContext.request.contextPath}/images/svg/link.svg">
							</span>
						</a></li>
					<c:if test="${fn:contains(info, 'Website')}">
						<c:set var='website' value="${fn:substringAfter(info, 'Website')}" />
						<li><a class="style_link" href="https://${website }/" target="_blank" rel="noreferrer"
								style="text-decoration: none;">
								<img src="${pageContext.request.contextPath}/images/svg/website.svg">
								<span class="style_address">
									${website }&nbsp;
									<img src="${pageContext.request.contextPath}/images/svg/link.svg">
								</span>
							</a></li>
					</c:if>
				</ul>
			</div>
			<div>
			<br>
				<h2>잘 맞는 추출방법</h2>
				<input type="hidden" id="extraction" value="${coffee.extraction }">
				<ul id="ext"></ul>
			</div>
			<br>
			<div>
				<h2>이렇게 마시면 맛있어요</h2>
				<input type="hidden" id="drinkbest" value="${coffee.drinkbest }">
				<ul id="drink"></ul>
			</div>
			<br>
			<div>
				<h2>원두노트</h2>
				<input type="hidden" id="origin" value="${coffee.origin2 }">
				<p>${coffee.origin2 }</p>
			</div>
		</div>
		<div class="sidebar">
			<h1>${coffee.taste }</h1>
			<h4>${coffee.blend }</h4>
			<h5>${coffee.price }</h5>
			<h5>${coffee.added }</h5>
			<c:if test="${not empty sessionScope.sUser }">
				<a href="${pageContext.request.contextPath}/order?order_id=${coffee.id}" class="btn btn-info"
					role="button">구매하기</a>
			</c:if>
		</div>

	</div>
	<iFrame onload="init();" style="visibility: hidden; display: none"></iFrame>
	<%@ include file="../includes/footer.jsp"%>
</div>
