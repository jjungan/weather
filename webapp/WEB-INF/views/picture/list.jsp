<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>weather</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		</div>
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<c:if test="${!empty sessionScope.authMember.name }">
					<h2>안녕하세요.  
					${sessionScope.authMember.name }의  MYSITE에 오신 것을 환영합니다.</h2>
					</c:if>
					<c:if test="${empty sessionScope.authMember.name }">
					<h2>안녕하세요. MYSITE에 오신 것을 환영합니다.</h2>
					</c:if>
					<div id="weather">
					</div>
					
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>