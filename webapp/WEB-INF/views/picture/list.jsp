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
	background-color: #999;
	opacity: 0.6;
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
	text-align:center;
	padding: 50px;
	font-style: italic;
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
		/*이미지 뷰어 bpopup*/
		$(".like").click(function(){
			/* console.log($(this).children().val());
			$("#view-image"+no).dialog(); */
			var no=$(this).children().val();
			$("#view-image"+no).bPopup();
		})
		
		/*좋아요 누르기*/
		$(".likeBtn").click(function(){
			$.ajax({
				method: "POST",
				url: "/weather/picture/like",
				data: {
					
					},
				success: function(response){
					console.log("인서트성공");
				},
				error: function(){
					alert("error");
					return;
				}
			});
		})
		
		/*검색버튼*/
		$("#searchbtn").click(function(){
			var keyword=$("#searchform").val();
			$.ajax({
				method: "POST",
				url: "/weather/picture/search",
				data: keyword,
				success: function(response){
					console.log("인서트성공");
				},
				error: function(){
					alert("error");
					return;
				}
			});
		})
	})


</script>

</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp">
				<c:param name="type" value="picture"></c:param>
			</c:import>
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
							<tr><td>${pictureVo.email }</td></tr>
							<tr><td>${pictureVo.content }</td></tr>
							<tr><td>${pictureVo.season }</td></tr>
							<tr><td>${pictureVo.weather }</td></tr>
							<tr><td>${pictureVo.location}</td></tr>
							<tr><td>${pictureVo.time }</td></tr>
							<tr><td class="likeBtn">좋아요<img src="/weather/assets/images/user.png" style="width:10px;">${pictureVo.likes }</td></tr>
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
							<tr><td>${pictureVo.email }</td></tr>
							<tr><td>${pictureVo.content }</td></tr>
							<tr><td>${pictureVo.season }</td></tr>
							<tr><td>${pictureVo.weather }</td></tr>
							<tr><td>${pictureVo.location}</td></tr>
							<tr><td>${pictureVo.time }</td></tr>
							<tr><td>좋아요<img src="/weather/assets/images/user.png" style="width:10px;">${pictureVo.likes }</td></tr>
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