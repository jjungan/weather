<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/weather/assets/css/user.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		</div>
		<div id="wrapper">
			<div id="content">
				<div id="user">
				<form id="login-form" name="loginform" method="post" action="/weather/member/login">
					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" autofocus="autofocus">
					<label class="block-label" >패스워드</label>
					<input name="password" type="password" >
					
					<c:if test="${param.result == 'fail'}">
						<p>로그인이 실패 했습니다.</p>
					</c:if>
					
					<input type="submit" value="로그인" class="btn">
				</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		</div>
	</div>

</body>
</html>