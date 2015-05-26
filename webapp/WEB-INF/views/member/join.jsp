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
<script type="text/javascript" src="/weather/assets/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#submitBtn").click(function(){
			/* null체크 */
			if($("#email").val()=="" || $("#name").val()=="" || $("#password").val()==""){
				alert("*은 필수 입력사항입니다.");
				return;
			}
			var email = $("#email").val();
			$.ajax({
				method: "POST",
				url: "/weather/member/checkemail",
				data: { "email": email},
				success: function(response){
					if(response.flag){
						$("#join-form").submit();
					}else{
						$("#o-img").hide();
						$("#x-img").show();
						alert("중복된 아이디가 있습니다!");
						return;
					}
				},
				error: function(){
					alert("error");
					return;
				}
			});
		});
		$("#email").change(function(){
			var email = $(this).val();
			$.ajax({
				method: "POST",
				url: "/weather/member/checkemail",
				data: { "email": email},
				success: function(response){
					if(response.flag){
						$("#o-img").show();
						$("#x-img").hide();
					}else{
						$("#o-img").hide();
						$("#x-img").show();
					}
				},
				error: function(){
					alert("error");
				}
			}); 
		});
		
	});
</script>
</head>
<body>
	<div id="container">
		<div id="header">
		<c:import url="/WEB-INF/views/include/header.jsp">
		</c:import>
		</div>
		<div id="content">
			<div id="user">

				<form id="join-form" name="joinForm" method="post" action="/weather/member/join">
					<label class="block-label" for="name">이름*</label>
					<input id="name" name="name" type="text" autofocus="autofocus">

					<label class="block-label" for="email">이메일*</label>
					<input id="email" name="email" type="text">
					<div id="imgs">
						<img src="/weather/assets/images/o.gif" id="o-img">
						<img src="/weather/assets/images/x.png" id="x-img">
					</div>
					
					<label class="block-label">패스워드*</label>
					<input name="password" type="password" value="" required="required">
					
					<fieldset>
						<legend>성별</legend>
						<label>여</label> <input type="radio" name="gender" value="female" checked="checked">
						<label>남</label> <input type="radio" name="gender" value="male">
					</fieldset>

					
					<input type="button" id="submitBtn" value="가입하기" class="btn">
					
				</form>
			</div>
		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp">
			</c:import>
		</div>
	</div>
</body>
</html>