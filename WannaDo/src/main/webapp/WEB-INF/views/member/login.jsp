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

<script type="text/javascript" src="../js/member.js" charset="utf-8"></script>
<!-- <script type="text/javascript">
/**
 * 
 */
 
$(document).ready(function(){
	//alert("aaaaaaaaaaaaaaa");
	//var exp = /^[0-9]{3}[0-9]{4}[0-9]{4}$/
	
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
			url:"/join",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data)
		})
		.done(function(res){
			if(res=="success"){
				alert("회원가입을 축하합니다");
				location.href="/login";
			}else if(res=="fail"){
				alert("아이디 중복확인하세요");
				$("#id").val("")
			}
		})
		//$("#frm").submit();
		
	});
	
	/*아이디 중복 검사*/
	
		$("#btnIdCheck").click(function() {

		$.ajax({
			type : "post",
			url : "/checkId",
			data : {
				"userid" : $("#userid").val()
			}
		}).done(function(resp) {
			if (resp == "fail") {
				alert("중복된 ID 입니다.");
				location.href = "/join"
			} else if (resp == "success") {
				alert("회원 가입 가능한 ID 입니다.");
				
			} else {
				alert("ID를 확인하세요");
			}
		})
	})
	
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
				/*alert("로그인 성공");*/
				location.href = "${pageContext.request.contextPath}/index"
			} else {
				alert("비밀번호를 확인하세요");
			}
		})
	})
	
});
</script> -->

<%@ include file="../includes/footer.jsp"%>