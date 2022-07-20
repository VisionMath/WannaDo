<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!-- <script type="text/javascript" src="../js/member.js"></script> -->

<div class="container">
	<h2>로그인</h2>
	<br> <br>
	<form action="/index" method="post" style="width: 300px; margin-left: auto; margin-right: auto;">
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">
					<i class="fa-solid fa-user" style="width: 20px;"></i>
				</span>
			</div>
			<input type="text" class="form-control" id="userid" placeholder="Enter userid" name="userid">
		</div>
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text">
					<i class="fa-solid fa-key" style="width: 20px;"></i>
				</span>
			</div>
			<input type="password" class="form-control" id="password" placeholder="Enter password"
				name="password">
		</div>
		<button type="button" class="btn btn-primary btn-sm" id="btnLogin" style="width: 300px">로그인</button>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnLogin").click(function() {

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/login",
				data : {
					"userid" : $("#userid").val(),
					"password" : $("#password").val()
				}
			}).done(function(resp) {
				if (resp == "no") {
					alert("회원이 아닙니다. 회원가입하세요");
					location.href = "${pageContext.request.contextPath}/join"
				} else if (resp == "success") {
					location.href = "${pageContext.request.contextPath}/index"
				} else {
					alert("비밀번호를 확인하세요");
				}
			})
		})
	});
</script>

<%@ include file="../includes/footer.jsp"%>