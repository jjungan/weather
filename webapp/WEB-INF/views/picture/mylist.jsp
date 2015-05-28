<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>weather</title>
<link href="/weather/assets/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
#addimage-li{
	float:left;
	margin:0;
	width:284px;
	height:213px;
}
#addimage{
	width:284px;
	height:213px;
}
.like{
	background-color: #777;
	color:#fff;
}
.first{
	width:568px;
	height:426px;
}
.remain{
	width:284px;
	height:213px;
}
.remain-li{
	float:left;
	margin:0;
	width:284px;
	height:213px;
}
.first-li{
	float:left;
	margin:0;
	width:568px;
	height:426px;
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
</style>
<script type="text/javascript" src="/weather/assets/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		/*이미지 마우스오버시 메뉴*/
		$(".like").css("display","none");
		$(".modal-target").css("display","none");
		$("img.first, img.remain").mouseover(function(){
			$(this).css("display","none");
			$(this).next().css("display","inline-block");
		})
		
		$("div.first.like, div.remain.like").mouseout(function(){
			$(this).css("display","none");
			$(this).prev().css("display","inline-block");
		})
		/*이미지 뷰어 bpopup*/
		$(".like").click(function(){
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
			location.href="/weather/picture/search?keyword="+encodeURIComponent(keyword);
		})
		/*사진인서트페이지로이동*/
		$("#addimage").click(function(){
			location.href="/weather/picture/insert";			
		})
	})


</script>

</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp" charEncoding="UTF-8">
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
					<li class="first-li">
						<img class="first" src="/weather/image/${pictureVo.image }">
						<div class="first like">
							<input type="hidden" value="${pictureVo.no }">
							<table class="view-table">
							<tr><td>${pictureVo.email }</td></tr>
							<tr><td>${pictureVo.content }</td></tr>
							<tr><td>${pictureVo.location}</td></tr>
							<tr><td class="likeBtn">좋아요<img src="/weather/assets/images/user.png" style="width:10px;">${pictureVo.likes }</td></tr>
							</table>
						</div>
						<!-- bpopup -->
						<div class="place_popup" id="view-image${pictureVo.no }" title="Basic dialog">
							<img class="modal-image" src="/weather/image/${pictureVo.image }">
						</div>
					</li>
					</c:when>
					<c:otherwise>
					<li class="remain-li">
						<img class="remain" src="/weather/image/${pictureVo.image }">
						<div class="remain like">
							<input type="hidden" value="${pictureVo.no }">
							<table class="view-table">
							<tr><td>${pictureVo.email }</td></tr>
							<tr><td>${pictureVo.content }</td></tr>
							<tr><td>${pictureVo.location}</td></tr>
							<tr><td>좋아요<img src="/weather/assets/images/user.png" style="width:10px;">${pictureVo.likes }</td></tr>
							</table>
						</div>
						<!-- bpopup -->
						<div class="place_popup" id="view-image${pictureVo.no }" title="Basic dialog">
							<img class="modal-image" src="/weather/image/${pictureVo.image }">
						</div>
					</li>					
					</c:otherwise>
					</c:choose>
					</c:forEach>
					<li id="addimage-li">
						<img id="addimage" src="/weather/assets/images/placeholder.gif">
					</li>
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