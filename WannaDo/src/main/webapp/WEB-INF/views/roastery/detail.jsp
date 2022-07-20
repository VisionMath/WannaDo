<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<div class="container">

	<div>
		<img src="${roastery.subimage1 }" width=300px> <img src="${roastery.subimage2 }" width=300px>
		<img src="${roastery.subimage3 }" width=300px>
		<h2 class="style_title">${roastery.name }</h2>
		<p class="style_introduce">${roastery.content }</p>

		<ul class="style_links">
			<li><a class="style_link" href="https://map.naver.com/v5/search/${roastery.location }"
					target="_blank" rel="noreferrer" style="text-decoration: none;">
					<object data="/images/svg/location.svg"></object>
					<span class="style_address">
						${roastery.location }&nbsp;
						<object data="/images/svg/link.svg"></object>
					</span>
				</a></li>
			<li><a class="style_link" href="https://www.instagram.com/${roastery.instagram }"
					target="_blank" rel="noreferrer" style="text-decoration: none;">
					<object data="/images/svg/instagram.svg"></object>
					<span class="style_address">
						${roastery.instagram }&nbsp;
						<object data="/images/svg/link.svg"></object>
					</span>
				</a></li>
			<li><a class="style_link" href="https://${roastery.website }/" target="_blank"
					rel="noreferrer" style="text-decoration: none;">
					<object data="/images/svg/website.svg"></object>
					<span class="style_address">
						${roastery.website }&nbsp;
						<object data="/images/svg/link.svg"></object>
					</span>
				</a></li>
		</ul>
	</div>
	<%@ include file="../includes/footer.jsp"%>
</div>
<style>

</style>
