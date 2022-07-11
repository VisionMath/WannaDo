<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>
<script >
	var sell_price;
	var regex = /[^0-9]/g;

	function init() {
		price = document.getElementById('price').value;
		sell_price=parseInt(price.replace(regex, ""));
		document.getElementById('sum').value = sell_price;
	}
	function change() {
		price = document.getElementById('price').value;
		sell_price = parseInt(price.replace(regex, ""));
		hm = document.getElementById('amount');
		sum = document.getElementById('sum');
		
		sum.value = parseInt(hm.value) * sell_price;
	}
</script>

<form action="orderAction" method="post" >
	<div class="container">
		<h1>구매하기</h1>
		<div class="style_item">
			<div>
				<img src="${coffee.image }" width=200px>
			</div>
			<div class="style_itemDescription">
				<span class="style_sellerName"> ${coffee.roastery }</span><span class="style_sellerName">
					${coffee.blend }</span>
			</div>
			<div class="style_itemDescription">
				<span class="style_sellerName"> <input type=hidden name="price" value="${coffee.price }"
					id="price"> 수량:<input type="number" name="amount" value="1" size="3" min="1"
					onchange="change();" id="amount"></span> <span class="style_sellerName">가격:<input
					type="text" name="sum" size="11" id="sum" readonly>원
				</span>
			</div>
		</div>

		<hr>
		<h4>주문자: ${sUser.username}</h4>
		
		<h5>배송지</h5>
	</div>
</form>

<%@ include file="../includes/footer.jsp"%>
