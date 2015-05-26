<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/weather/assets/jquery/jquery-1.9.0.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*날씨 알아오기*/
		$.ajax()
		
		/* 내 현재위치를 찍어주는 소스. 근데 PC에서는 안정확 ㅜㅜ */
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
		               console.log(results);    //<< 이부분!!!
		               //alert('고객님은 현재 ' + results[2].formatted_address + '에 접속중이십니다.');
		               myAddress = results[2].formatted_address;
						sourceX = results[2].geometry.location.A;
						sourceY = results[2].geometry.location.F;
						console.log(myAddress);
						console.log(sourceX);
						console.log(sourceY);
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
</script>
</head>
<body>

</body>
</html>