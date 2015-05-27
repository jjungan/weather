<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/weather/assets/css/user.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#insert-table{
		width: 90%;
		height: 600px;
		margin: 30px auto;
	}
	#picture-insert{
		width: 100%;
	}
	#picture-td{
		width: 600px;
	}
	#preview{
		width: 600px;
	}
	#weather-td{
		width:350px;
	}
	#file-td{
		width: 30%;
	}
	#insert-table input[type=radio]{
		margin-left: 10px; 
	}
	.question{
		font-size: 1.5em;
	}
	.radio-td{
		vertical-align: top;
	}
</style>
<script type="text/javascript" src="/weather/assets/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	 function readURL(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
             reader.onload = function (e) {
             //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                 $('#preview').attr('src', e.target.result);
                 //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                 //(아래 코드에서 읽어들인 dataURL형식)
             };                   
             reader.readAsDataURL(input.files[0]);
             //File내용을 읽어 dataURL형식의 문자열로 저장
         }
     }//readURL()--

     //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
     $("#image").change(function(){
         //alert(this.value); //선택한 이미지 경로 표시
         readURL(this);
     });
	
	
});

</script>
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp"/>
		</div>
		<div id="content">
			<div id="picture-insert">
				<form id="insert-form" name="insertForm" method="post" action="/weather/picture/insert">
					<table id="insert-table">
						<tr>
							<td colspan="2" rowspan="6" id="picture-td">
						        <img id="preview" src="/weather/assets/images/placeholder.gif" alt="your image" />
							</td>
							<td colspan="2" id="weather-td" class="question">오늘의 날씨는?</td>
						</tr>
						<tr>
							<td colspan="2" class="radio-td">
								<input type="radio" name="climate">해 
								<input type="radio" name="climate">비 
								<input type="radio" name="climate">구름 
								<input type="radio" name="climate">안개 
								<input type="radio" name="climate">눈 
								<input type="radio" name="climate">기타 
							</td>
						</tr>
						<tr>
							<td colspan="2" class="question">계절은 무엇인가요?</td>
						</tr>
						<tr>
							<td colspan="2" class="radio-td">
								<input type="radio" name="season">봄 
								<input type="radio" name="season">여름 
								<input type="radio" name="season">가을 
								<input type="radio" name="season">겨울 
							</td>
						</tr>
						<tr>
							<td colspan="2" class="question">지금은 몇시?</td>
						</tr>
						<tr>
							<td colspan="2" class="radio-td">
								<input type="radio" name="time">낮(6:00 ~ 18:00) 
								<input type="radio" name="time">밤(18:00 ~ 6:00) 
							</td>
						</tr>
						<tr>
							<td id="file-td">
								<input type="file" name="image" id="image">
							</td>
							<td id="submit-td">
								<input type="submit" value="사진올리기">
							</td>
							<td colspan="2"></td>
						</tr>
					</table>
				</form>
			</div>

		</div>
		<div id="footer">
			<c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</div>




</body>
</html>