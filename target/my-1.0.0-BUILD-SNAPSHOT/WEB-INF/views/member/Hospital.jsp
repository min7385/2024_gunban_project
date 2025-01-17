<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>동물병원 찾기</title>
</head>
<body>

	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>
	
	<!-- 내 위치를 중심으로 지도 그리기 -->
	<div id="map" style="width:1000px;height:800px; margin:0 auto;">
	</div>
	<!-- 실제 지도를 그리는 Javascript API를 불러오기 && services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee9b8b5c35fedfac23c9bc5716767594&libraries=services,clusterer,drawing"></script>
	<!-- 지도를 띄우는 코드 작성 -->
	<script>
	    var container = document.getElementById('map'); // 지도를 표시할 div 
	    var map, geocoder, openInfowindow = null; // 전역 변수로 지도, 지오코더, 열려있는 인포윈도우 객체 선언

	    // 현재 위치 가져오기
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(function(position) {
	            var lat = position.coords.latitude; // 위도
	            var lng = position.coords.longitude; // 경도
	
	            // 지도의 중심 좌표 설정
	            var options = {
	            	center: new kakao.maps.LatLng(lat, lng), // 현재 위치를 중심 좌표로 설정
	                level: 6
	            };
	            
	            // 지도 생성
	            map = new kakao.maps.Map(container, options);
	            
	            // 현재 위치에 마커 추가
	            var marker = new kakao.maps.Marker({
	                position: new kakao.maps.LatLng(lat, lng),
	                map: map
	            });
	
	            // 동물병원 위치 추가 (사용자 위치를 기준으로 지도 생성 후 실행)
	            addAnimalHospitals();
	
	        }, function(error) {
	            console.error('Geolocation error:', error);
	        });
	    } else {
	        alert('Geolocation is not supported by this browser.');
	    }

	    // 동물병원 위치 표시하는 함수
	    function addAnimalHospitals() {
	        geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체 생성
	        
	        var positions = [
	            // JSP에서 서버 측 데이터를 자바스크립트로 전달
	            <c:forEach items="${mapList}" var="maps">
	                {title: '${maps.name}', address: '${maps.address}'},
	            </c:forEach>
	        ];

	        // 주소로 좌표를 검색해 지도에 마커 추가
	        positions.forEach(function (position) {
	            geocoder.addressSearch(position.address, function(result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                    var imageSrc = "${pageContext.request.contextPath}/assets/img/marker2.png",
	                        imageSize = new kakao.maps.Size(46, 58),
	                        imageOption = {offset: new kakao.maps.Point(27, 69)};
	                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

	                    var marker = new kakao.maps.Marker({
	                        map: map,
	                        position: coords,
	                        image: markerImage
	                    });

	                    // 인포윈도우를 마커의 클릭 이벤트에 연결
	                    var infowindow = new kakao.maps.InfoWindow({
	                        content: '<div style="width:200px;text-align:center;padding:10px;">' 
	                            + '<strong>' + position.title + '</strong><br>' 
	                            + '주소: ' + position.address 
	                            + '</div>'
	                    });

	                    // 마커 클릭 시 인포윈도우 표시/닫기
	                    kakao.maps.event.addListener(marker, 'click', function() {
	                        if (openInfowindow) {
	                            openInfowindow.close(); // 다른 인포윈도우가 열려 있으면 닫기
	                        }

	                        if (openInfowindow !== infowindow) { // 클릭된 인포윈도우가 현재 열린 인포윈도우와 다르면
	                            infowindow.open(map, marker); // 인포윈도우 열기
	                            openInfowindow = infowindow;  // 현재 열린 인포윈도우를 기록
	                        } else {
	                            openInfowindow = null;  // 같은 마커 클릭 시 닫힌 상태로 변경
	                        }
	                    });
	                }
	            });
	        });
	    }
	</script>
	
	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
    
</body>
</html>
