<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>weather</title>
<link href="/weather/assets/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
.like{
	background-color: #A5D1F5;
}
.first{
	width:568px;
	height:426px;
}
.remain{
	width:284px;
	height:213px;
}
li{
	float:left;
}
</style>
<script type="text/javascript" src="/weather/assets/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".like").hide();
		$("img.first, img.remain").mouseover(function(){
			$(this).hide();
			$(this).next().show();
		})
		
		$("div.first.like, div.remain.like").mouseout(function(){
			$(this).hide();
			$(this).prev().show();
		})
	})


</script>

</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		</div>
		<div id="wrapper">
			<div id="content">
				<div id="picturelist" style="margin:0 5% 0 5%; height:500px;" >
					<ul>
					<c:forEach items="${list }" var="pictureVo" varStatus="status">
					<c:choose>
					<c:when test="${status.index == '0' }">
					<li>
						<img class="first" src="/weather/assets/images/tempimages/${pictureVo.image }">
						<div class="first like">
							<div class="picture-title">${pictureVo.title }</div>
							<div class="picture-likes">좋아요 ${pictureVo.likes }</div>
						</div>
					</li>
					</c:when>
					<c:otherwise>
					<li><img class="remain" src="/weather/assets/images/tempimages/${pictureVo.image }">
						<div class="remain like">
							<div class="picture-title">${pictureVo.title }</div>
							<div class="picture-likes">좋아요 ${pictureVo.likes }</div>
						</div>
					</li>					
					</c:otherwise>
					</c:choose>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>