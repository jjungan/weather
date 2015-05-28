<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>weather</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/weather/assets/css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#site-introduction{
		width: 90%;
		margin: 0 auto;
		text-align: center;
	}
	#login-introduction{
		margin-top: 50px;
		height: 50px;
		color: #777;
	}
	#weather{
		height: 100px;
		color: #666;
	}
	#weather-icon{
		height: 250px;
	}
	#weather-icon img{
		width: 200px;
	}
	#description{
		height: 100px;
		font-size: 1.2em;
		color: #777;
	}
	span span#title{
		font-size: 1.4em;
	}
	
</style>
<script type="text/javascript" src="/weather/assets/jquery/jquery-1.9.0.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script type="text/javascript">
	var sourceX;
	var sourceY;
	var myAddress;
	$(document).ready(function() {
		/* 내 현재위치를 찍어주는 소스*/
		if (navigator.geolocation) {   //geolocation 을 사용할수 있는 HTML5 인지 확인
			navigator.geolocation.getCurrentPosition(function(pos){  	//현재 위치값 얻기
			GoogleMap.initialize(pos.coords.latitude, pos.coords.longitude); //하단에 선언한 GoogleMap통하여 나머지 처리
		}, function (e) {
				console.log({
			                0: '위치 정보 검색에 문제가 있습니다.(msg:' + e.message + ')',
			                1: '현재 페이지에서 사용자가 위치 정보 검색을 거부했습니다.',
			                2: '브라우저가 위치정보를 검색하지 못했습니다.(msg:' + e.message + ')',
			                3: '브라우저의 위치 정보 검색 시간이 초과됐습니다.',
	            }[e.code]);
		        }, {
			        enableHeighAccuracy: true,
		            timeout: 10000,
		            maximumAge: 0
			        });
		}
		 	GoogleMap = {  
				initialize : function(latitude, longitude) {  
				var geocoder = new google.maps.Geocoder();
				geocoder.geocode({'latLng' : new google.maps.LatLng(latitude, longitude)} ,
					function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
		               console.log(results);    
		               myAddress = results[2].formatted_address;
						sourceX = Math.round(results[2].geometry.location.A);
						sourceY = Math.round(results[2].geometry.location.F);
						console.log(myAddress);
						console.log(sourceX);
						console.log(sourceY);
						
						getWeather();
		               } 
		           });
		        }
			 } 
    
    	/* 처음에 지도 기능 세팅해주는 초기화 함수 */
		function initialize() {
		  directionsDisplay = new google.maps.DirectionsRenderer();
		  geocoder = new google.maps.Geocoder();

		  var mapOptions = {
		    zoom: 13,
		    center: new google.maps.LatLng(37.5010226, 127.0396037)
		  }; 
		  map = new google.maps.Map(document.getElementById('map-canvas'),
		      mapOptions);

		  directionsDisplay.setMap(map);
		  directionsDisplay.setPanel(document.getElementById('directions-panel'));
		
		  var control = document.getElementById('control');
		  control.style.display = 'block';
		  map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
		  
		}
			

	})
	
	/*날씨 알아오기*/
	var hour;
	var min;
	var temp;
	var wfKor;
	function getWeather(){
		$.ajax({
			type: "GET",
			url: "test_proxy.jsp?sourceX="+sourceX+"&sourceY"+sourceY,
			success: function(response){
				console.log(response);
				hour=new Date().getHours();
				min=new Date().getMinutes();
				var data=$(response).find("data");
				
				data.each(function(index){
					if(index==0){
						temp=$(this).find("temp").text();
						wfKor=$(this).find("wfKor").text();
					}
				})
				
				$("#weather").append("<h1>현재 시간 "+hour+"시 "+min+"분<br> "+myAddress+"의 날씨는 "+wfKor+"</h1>");
				
				/* 오늘 날씨에 맞는 이미지 넣기 */
				var src = '/weather/assets/images/weather_icon/';
				if(wfKor.indexOf('맑음') != -1){
					src += 'sunny.png'; 
				}else if(wfKor.indexOf('구름조금') != -1){
					src += 'partly_cloudy.png'; 
				}else if(wfKor.indexOf('구름많음') != -1){
					src += 'cloudy.png'; 
				}else if(wfKor.indexOf('비') != -1){
					src += 'rain.png'; 
				}else if(wfKor.indexOf('눈') != -1){
					src += 'cloudy.png'; 
				}
				$("#weather-icon").append("<img src='"+src+"'>");
				
				/* 로그인 했을때만 DB에 날씨 인서트 or 업데이트 */
				if('${sessionScope.authMember}' != ''){
					insertWeather();
				}
			},
			error: function(){
				alert("error");
				return;
			}
		});
 	}
	
	function insertWeather(){
		$.ajax({
			method: "POST",
			url: "/weather/weather/insert",
			data: {
				"x": sourceX,
				"y": sourceY,
				"address":myAddress,
				"climate":wfKor,
				"time":hour,
				"temp": temp
				},
			success: function(response){
				console.log("인서트/업데이트 성공");
			},
			error: function(){
				alert("error");
				return;
			}
		});
	}
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		</div>
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<div id="login-introduction">
						<c:if test="${!empty sessionScope.authMember.name }">
							<span>
							안녕하세요 ${sessionScope.authMember.name }님, 방문을 환영합니다.
							</span>
						</c:if>
						<c:if test="${empty sessionScope.authMember.name }">
							<span>
							로그인 하시면 더욱 다양한 서비스를 이용할 수 있습니다.
							</span>
						</c:if>
					</div>
					<div id="weather"></div>
					<div id="weather-icon"></div>
					<div id="description">
						<span>
							<span id="title">HOW’S THE WEATHER TODAY</span>는<br>
							여러분의 바쁜 일상 속 여유를 찾아드리기 위한 사이트 입니다.<br> 
							여러분이 사는 곳의 하늘을 사진으로 찍어보세요. <br>
							다른 사람들이 올린 다양한 사진을 감상 할 수도 있습니다.
						</span>
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