<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>
<script>
	var sell_price;
	var regex = /[^0-9]/g;

	function formatNumber(n1) {
		return n1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
	function init() {
		price = document.getElementById('price').value;
		sell_price = parseInt(price.replace(regex, ""));
		document.getElementById('sum').value = formatNumber(sell_price);
		document.getElementById('order').value = formatNumber(sell_price);
		total.value = formatNumber(sell_price + 3000);
	}
	function change() {
		price = document.getElementById('price').value;
		sell_price = parseInt(price.replace(regex, ""));
		hm = document.getElementById('amount');
		sum = document.getElementById('sum');
		order = document.getElementById('order');
		total = document.getElementById('total');

		sum.value = formatNumber(parseInt(hm.value) * sell_price);
		order.value = sum.value;
		total.value = formatNumber(parseInt(order.value.replace(regex, "")) + 3000);
	}
	
</script>

<form action="orderAction" method="post">
	<div class="container" style="width: 600px;">
		<h1>구매하기</h1>
		<div class="style_item">
			<div>
				<input type="hidden" name="coffeeid" value="${coffee.id }" id="coffeeid">
				<img src="${coffee.image }" width=200px>
			</div>
			<div class="style_itemDescription">
				<span class="style_sellerName" style="margin-bottom: 10px;"> ${coffee.roastery }</span>
				<span class="style_sellerName"> ${coffee.blend }</span>
			</div>
			<div class="style_itemDescription">
				<span class="style_sellerName">
					<input type="hidden" name="price" value="${coffee.price }" id="price">
					수량&nbsp;
					<input type="number" name="amount" value="1" min="1" onchange="change();" id="amount"
						style="width: 100px; margin-bottom: 10px;">
				</span>
				<span class="style_sellerName">
					가격&nbsp;
					<input type="text" name="sum" id="sum" style="width: 100px;" class="order_value" readonly>
					원
				</span>
			</div>
		</div>
		<input type="hidden" name="userid" id="userid" value="${sUser.userid }" readonly>
		<hr>
		<h5>주문자</h5>
		<div class="style_input">${sUser.name}</div>
		<h5>휴대폰</h5>
		<div class="style_input">${sUser.phone}</div>
		<h2>배송지</h2>
		<input type="text" name="address" id="address" class="style_input" style="width: 100%; margin-bottom: 0px;">
		<hr>
		<h2>결제 금액</h2>
		<ul>
			<li class="style_item_order"><span>주문 금액</span> <span>
					<input type="text" name="order" id="order" class="order_value" readonly>
					원
				</span></li>
			<li class="style_item_order"><span>배송비</span> <span>
					<input type="text" name="fee" id="fee" class="order_value" value="3,000" readonly>
					원
				</span></li>
		</ul>
		<h3 class="style_item_order">
			총 결제 금액
			<span>
				<input type="text" name="total" id="total" class="order_value" readonly>
				원
			</span>
		</h3>
		<div style="text-align:center;margin-top:20px;">
			<a href="#" class="btn btn-info" role="button" style="width: 80%;" id="orderConfirm">구매하기</a>
		</div>
	</div>
	<iFrame onload="init();" style="visibility:hidden;display:none"></iFrame>
</form>

<script type="text/javascript" src="../js/order.js"></script>
<%@ include file="../includes/footer.jsp"%>
