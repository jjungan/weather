<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<h1><a href="/weather/">HOW'S THE WEATHER TODAY?</a></h1>
	<ul>
		<c:choose>
		<c:when test="${empty sessionScope.authMember }">
			<li><a href="/weather/member/login">로그인</a><li>
			<li><a href="/weather/member/join">회원가입</a><li>
		</c:when>
		<c:otherwise>
			<li><a href="/weather/member/myinfo">회원정보수정</a><li>
			<li><a href="/weather/member/logout">로그아웃</a><li>
			<li>${sessionScope.authMember.name }(${sessionScope.authMember.email })님 환영합니다</li>
			<li><img id="profile" src="/weather/assets/images/user.png"></li>
		</c:otherwise>
		</c:choose>
	</ul>