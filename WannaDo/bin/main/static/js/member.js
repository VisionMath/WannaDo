$(document).ready(function(){
	
	var ctx = getContextPath();
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
}
	
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
			url:ctx+"/join",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data)
		})
		.done(function(res){
			if(res=="success"){
				alert("회원가입을 축하합니다");
				location.href=ctx+"/login";
			}else if(res=="fail"){
				alert("아이디 중복확인하세요");
				$("#id").val("")
			}
		})
		
	});
	
		$("#btnIdCheck").click(function() {

		$.ajax({
			type : "post",
			url : ctx+"/checkId",
			data : {
				"userid" : $("#userid").val()
			}
		}).done(function(resp) {
			if (resp == "fail") {
				alert("중복된 ID 입니다.");
				location.href = ctx+"/join"
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
			url : ctx+"/login",
			data : {
				"userid" : $("#userid").val(),
				"password" : $("#password").val()
			}
		}).done(function(resp) {
			if (resp == "no") {
				alert("회원이 아닙니다. 회원가입하세요");
				location.href = ctx+"/join"
			} else if (resp == "success") {
				location.href = ctx+"/index"
			} else {
				alert("비밀번호를 확인하세요");
			}
		})
	})
	
});