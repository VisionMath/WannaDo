<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!-- <script type="text/javascript" src="../js/member.js"></script> -->

<div class="container">
	<h2>Join us</h2>
	<hr style="padding-bottom: 10px;">
	<form action="#" method="post">
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="userid">아이디</label>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" id="userid" placeholder="Enter username" name="userid">
			</div>
			<div class="col align-self-end">
				<button type="button" class="btn btn-primary" id="btnIdCheck">중복확인</button>
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="pass">비밀번호</label>
			</div>
			<div class="col-4">
				<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="pass_check">비밀번호확인</label>
			</div>
			<div class="col-4">
				<input type="password" class="form-control" id="pass_check" placeholder="Enter password_check" name="pass_check">
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="name">이름</label>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" id="name" placeholder="이름" name="name">
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="phone">휴대전화</label>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" id="phone" placeholder="휴대전화" name="phone">
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="email">이메일</label>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
			</div>
		</div>
		<br>
		<br>
		<div>
			<h3 style="padding-bottom: 10px;">전체동의</h3>
			<p style="padding-bottom: 10px;">
				<span>
					이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.&nbsp;&nbsp;
					<input type="checkbox" id="agree" style="zoom: 1.5; padding-bottom: 10px;">
				</span>
			</p>
		</div>
		<button type="button" class="btn btn-primary btn-sm" id="btnJoin" style="width: 80px;">회원가입</button>
	</form>
</div>

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnJoin").click(function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		if($("#password").val() == "") {
			alert("비밀번호를 입력하세요");
			$("#password").focus();
            return false;
		}
		if($("#pass_check").val() == "") {
			alert("비밀번호를 입력하세요");
			$("#pass_check").focus();
            return false;
		}
		if($("#password").val() != $("#pass_check").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pass_check").focus();
            return false;
		}
		if($("#name").val() == "") {
			alert("이름을 입력하세요");
			$("#name").focus();
            return false;
		}
		if($("#phone").val() == "") {
			alert("전화번호를 입력하세요");
			$("#phone").focus();
            return false;
		}
		if($("#email").val() == "") {
			alert("이메일을 입력하세요");
			$("#email").focus();
            return false;
		}
		var data={
			"userid":$("#userid").val(),
			"name":$("#name").val(),
			"phone":$("#phone").val(),
			"email":$("#email").val(),
			"password":$("#password").val(),
			"role":"USER"
		}
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/join",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data)
		})
		.done(function(res){
			if(res=="success"){
				alert("회원가입을 축하합니다");
				location.href="${pageContext.request.contextPath}/login";
			}else if(res=="fail"){
				alert("아이디 중복확인하세요");
				$("#id").val("")
			}
		})
	});
	
		$("#btnIdCheck").click(function() {

		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/checkId",
			data : {
				"userid" : $("#userid").val()
			}
		}).done(function(resp) {
			if (resp == "fail") {
				alert("중복된 ID 입니다.");
				location.href = "${pageContext.request.contextPath}/join"
			} else if (resp == "success") {
				alert("회원 가입 가능한 ID 입니다.");
				
			} else {
				alert("ID를 확인하세요");
			}
		})
	})
});
</script>









