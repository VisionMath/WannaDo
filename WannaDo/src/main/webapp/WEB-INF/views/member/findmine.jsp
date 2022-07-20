<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<script type="text/javascript">
	function init() {
		var extArray = [ '커피메이커', '핸드드립', '에스프레소머신', '모카포트', '프렌치프레스',
				'에어로프레스', '콜드브루' ];
		var svgArray = [ 'coffeeMaker.svg', 'handDrip.svg', 'espreso.svg',
				'mocapot.svg', 'frenchpress.svg', 'aeropress.svg',
				'coldbrew.svg' ]

		for (var i = 0; i < extArray.length; i++) {
			$('.find_main')
					.append(
							"<div class='find_wrapper'><img src='/images/svg/"+svgArray[i]+"' width='80' height='80'><span class='style_label'>"
									+ extArray[i] + "</span></div>");
		}
	}
	
	$(function() {
		$('.find_wrapper').click(function(){
			var drinkArray = [ '블랙 그대로', '우유 넣은 라떼', '설탕을 넣은 커피', '시럽을 넣은 커피' ];
			var drinkSVG = [ 'black.svg', 'milk.svg', 'sugar.svg', 'syrup.svg' ];
			
			$('.find_main').empty();
			$('.find_title').text("어떤 커피를 즐기세요?")
			for (var i=0; i<drinkArray.length;i++) {
					$('.find_main')
					.append(
							"<div class='find_wrapper'><img src='/images/svg/"+drinkSVG[i]+"' width='80' height='80'><span class='style_label'>"+drinkArray[i]+"</span></div>");				
			}
		})	
	})
	
</script>

<div class="container">
	<div class="main_wrapper">
		<h1 class="find_title">커피를 어떻게 내려 드세요?</h1>
		<div class="find_children">
			<div class="find_main"></div>
		</div>
	</div>
	<iFrame onload="init();" style="visibility: hidden; display: none"></iFrame>
	<%@ include file="../includes/footer.jsp"%>
</div>

