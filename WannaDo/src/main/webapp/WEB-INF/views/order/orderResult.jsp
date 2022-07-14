<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<h2>주문 정보</h2><br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>커피</th>
				<th>맛</th>
				<th>종류</th>
				<th>수량</th>
				<th>단가</th>
				<th>배송비</th>
				<th>총액</th>
				<th>주소</th>
				<th>상태</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderList}" var="order">
				<tr>
					<td><img src="${order.coffeeImage}" width=100px></td>
					<td>${order.taste}</td>
					<td>${order.blend}</td>
					<td>${order.amount}</td>
					<td>${order.price}</td>
					<td>${order.fee}</td>
					<td>${order.total}</td>
					<td>${order.address}</td>
					<td>${order.status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<%@ include file="../includes/footer.jsp"%>
</div>
