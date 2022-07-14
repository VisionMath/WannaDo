<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<h2>Join us</h2>
	<hr style="padding-bottom:10px;">
	<form action="#" method="post">
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="userid">아이디</label>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" id="userid"
					placeholder="Enter username" name="userid">
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
				<input type="password" class="form-control" id="password"
					placeholder="Enter password" name="password">
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="pass_check">비밀번호확인</label>
			</div>
			<div class="col-4">
				<input type="password" class="form-control" id="pass_check"
					placeholder="Enter password_check" name="pass_check">
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="name">이름</label>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" id="name" placeholder="이름"
					name="name">
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="phone">휴대전화</label>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" id="phone"
					placeholder="휴대전화" name="phone">
			</div>
		</div>
		<div class="row">
			<div class="col-2 align-self-start">
				<label for="email">이메일</label>
			</div>
			<div class="col-4">
				<input type="text" class="form-control" id="email"
					placeholder="Enter email" name="email">
			</div>
		</div>
		<br><br>
		<div>
			<h3 style="padding-bottom:10px;">전체동의</h3>
			<p style="padding-bottom:10px;"><span>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.&nbsp;&nbsp;<input
				type="checkbox" id="agree" style="zoom:1.5;padding-bottom:10px;"></span></p>
		</div>
		<button type="button" class="btn btn-primary btn-sm" id="btnJoin" style="width:80px;">회원가입</button>
	</form>
</div>

<script type="text/javascript" src="../js/member.js?var=2"></script>

<%@ include file="../includes/footer.jsp"%>









