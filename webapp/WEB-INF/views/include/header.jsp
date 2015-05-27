<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<h1><a href="/weather/index">HOW'S THE WEATHER TODAY?</a></h1>
	<ul>
		<li class="left">오늘의 날씨</li>
		<c:if test="${sessionScope.weather == '맑음' }">
		<li class="left"><img src="/weather/assets/images/user.png" style="width:20px; margin-left:5px;"></li>
		</c:if>
		<c:if test="${sessionScope.weather == '구름 조금' }">
		<li class="left"><img src="/weather/assets/images/user.png" style="width:20px; margin-left:5px;"></li>
		</c:if>
		<li class="left"><a href="/weather/picture/list">전체하늘</a></li>
		<li class="left"><a href="/weather/picture/mylist">내하늘</a></li>
		
		<c:if test="${param.type == 'picture' }">
			<li class="left">
				<input id="searchform" name="searchform" type="text" placeholder="검색하세요">
			</li>
			<li class="left">
				<img id="searchbtn" src="/weather/assets/images/user.png" style="width:20px; margin-left:5px;">
			</li>
		</c:if>
	
		<c:choose>
		<c:when test="${empty sessionScope.authMember }">
			<li class="right"><a href="/weather/member/login">로그인</a><li>
			<li class="right"><a href="/weather/member/join">회원가입</a><li>
		</c:when>
		<c:otherwise>
			<li class="right"><a href="/weather/member/myinfo">회원정보수정</a><li>
			<li class="right"><a href="/weather/member/logout">로그아웃</a><li>
			<li class="right">${sessionScope.authMember.name }(${sessionScope.authMember.email })님 환영합니다</li>
			<li class="right"><img id="profile" src="/weather/assets/images/user.png"></li>
		</c:otherwise>
		</c:choose>
	</ul>