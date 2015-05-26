<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>weather</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/weather/assets/css/user.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/weather/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#join-form").submit(function(){
		if($("#check-btn").is(":visible") == true){
			alert("이메일 중복여부를 확인해주세요.");
			return false;
		}
		return true;
	});
	
	$("#email").change(function(){
		$("#check-img").hide();
		$("#check-btn").show();
	})
	
	$("#check-btn").click(function(){
		var email="email="+$("#email").val();
		if(email == ""){
			alert("이메일을 입력해주세요.");
			return;
		}
		console.log(email);
		$.ajax({
			url : "/weather/member/checkemail",
			type : "post",
			data : email,
			success : function(map){
				if(map.result == true){
					$("#check-img").show();
					$("#check-btn").hide();
				}else if(map.result == false ){
					alert(map.msg);
				}
			}
		});
			
		
	})
	
	
})

</script>
</head>
<body>
	<div id="container">
		<div id="header">
		<c:import url="/views/include/header.jsp">
		</c:import>
		</div>
		<div id="content">
			<div id="user">

				<form id="join-form" name="joinForm" method="post" action="/mysite3/member/join">
					<label class="block-label" for="name">이름</label>
					<input id="name" name="name" type="text" value="">

					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<img id="check-img" src="/weather/assets/images/check.png" style="width:15px; display:none;">
					<input id="check-btn" type="button" value="중복체크">
					
					<label class="block-label">패스워드</label>
					<input name="password" type="password" value="" required="required">
					
					<fieldset>
						<legend>성별</legend>
						<label>여</label> <input type="radio" name="gender" value="female" checked="checked">
						<label>남</label> <input type="radio" name="gender" value="male">
					</fieldset>
					
					<!-- <fieldset>
						<legend>약관동의</legend>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
						<label>서비스 약관에 동의합니다.</label>
					</fieldset> -->
					
					<input type="submit" value="가입하기" class="btn">
					
				</form>
			</div>
		</div>
		<div id="footer">
			<c:import url="/views/include/footer.jsp">
			</c:import>
		</div>
	</div>
</body>
</html>