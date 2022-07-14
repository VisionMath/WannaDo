<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<h2>로그인</h2><br><br>
	<form action="/index" method="post" style="width:300px;margin-left: auto; margin-right: auto;">
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fa-solid fa-user" style="width:20px;"></i></span>
			</div>
			<input type="text" class="form-control" id="userid"
				placeholder="Enter userid" name="userid">
		</div>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text"><i class="fa-solid fa-key" style="width:20px;"></i></span>
			</div>
			<input type="password" class="form-control" id="password"
				placeholder="Enter password" name="password">
		</div>
		<button type="button" class="btn btn-primary btn-sm" id="btnLogin" style="width:300px">로그인</button>
	</form>
</div>

<script type="text/javascript" src="../js/member.js?var=3"></script>

<%@ include file="../includes/footer.jsp"%>