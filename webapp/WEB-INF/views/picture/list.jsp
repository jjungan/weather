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
	background-color: #e4e4e4;
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

.modal-image{
	width:568px;
	height:426px;
}
.place_popup{ 
	width:600px;
	height:600px;
	padding:5px;
	border-radius: 10px;
	display:none;
}
.like{
	text-align:center;
}
.view-table{
	padding: 20px; auto;
}
</style>
<script type="text/javascript" src="/weather/assets/jquery/jquery-1.9.0.js"></script>


<script type="text/javascript">
	$(document).ready(function(){
		/*이미지 마우스오버시 메뉴*/
		$(".like").hide();
		$(".modal-target").hide();
		$("img.first, img.remain").mouseover(function(){
			$(this).hide();
			$(this).next().show();
		})
		
		$("div.first.like, div.remain.like").mouseout(function(){
			$(this).hide();
			$(this).prev().show();
		})
		/*이미지 뷰어-모달*/
		$(".like").click(function(){
			/* console.log($(this).children().val());
			$("#view-image"+no).dialog(); */
			var no=$(this).children().val();
			$("#view-image"+no).bPopup();
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
							<input type="hidden" value="${pictureVo.no }">
							<table class="view-table">
							<tr><td>title</td><td>${pictureVo.title }</td></tr>
							<tr><td>writer</td><td>${pictureVo.email }</td></tr>
							<tr><td>content</td><td>${pictureVo.content }</td></tr>
							<tr><td>season</td><td>${pictureVo.season }</td></tr>
							<tr><td>weather</td><td>${pictureVo.weather }</td></tr>
							<tr><td>location</td><td>${pictureVo.location}</td></tr>
							<tr><td>time</td><td>${pictureVo.time }</td></tr>
							<tr><td>likes</td><td>${pictureVo.likes }</td></tr>
							</table>
						</div>
						<!-- modal -->
						<div class="place_popup" id="view-image${pictureVo.no }" title="Basic dialog">
							<img class="modal-image" src="/weather/assets/images/tempimages/${pictureVo.image }">
						</div>
					</li>
					</c:when>
					<c:otherwise>
					<li>
						<img class="remain" src="/weather/assets/images/tempimages/${pictureVo.image }">
						<div class="remain like">
							<input type="hidden" value="${pictureVo.no }">
							<table class="view-table">
							<tr><td>title</td><td>${pictureVo.title }</td></tr>
							<tr><td>writer</td><td>${pictureVo.email }</td></tr>
							<tr><td>content</td><td>${pictureVo.content }</td></tr>
							<tr><td>season</td><td>${pictureVo.season }</td></tr>
							<tr><td>weather</td><td>${pictureVo.weather }</td></tr>
							<tr><td>location</td><td>${pictureVo.location}</td></tr>
							<tr><td>time</td><td>${pictureVo.time }</td></tr>
							<tr><td>likes</td><td>${pictureVo.likes }</td></tr>
							</table>
						</div>
						<!-- modal -->
						<div class="place_popup" id="view-image${pictureVo.no }" title="Basic dialog">
							<img class="modal-image" src="/weather/assets/images/tempimages/${pictureVo.image }">
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
<script type="text/javascript" src="/weather/assets/jquery/jquery.bpopup.min.js"></script>
</html>