<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>4조 이숲</title>

  <!-- 모바일 웹 페이지 설정 -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />

  <!-- bootstrap -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

  <!-- 공통 style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/header.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/footer.css" />

  <!-- style -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/store.css" />


  <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>

  <!-- 웹 폰트 -->
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

  <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

  <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
  <script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDjxEehL7NxQ6UKGYDq3u1U87K3T0ouGGQ&callback=initMap&libraries=&v=weekly" defer></script>
  
  <style type="text/css">
      /* Always set the map height explicitly to define the size of the div
      * element that contains the map. */
      #map {
        height: 100%;
        width : 100%;
      }

      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      
      td, tr{
        border-top: 1px solid #EDEDED
      }
    </style>
    
    <script>
      function initMap() {
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom:13,
          center: { lat: 37.564, lng: 127.001 },
        });
        // Try HTML5 geolocation. 여기부터 현재 위치 찾기
        infoWindow = new google.maps.InfoWindow();
        const locationButton = document.createElement("button");
        locationButton.textContent = "현재위치에서 찾기";
        locationButton.classList.add("custom-map-control-button");
        map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
        locationButton.addEventListener("click", () => {

          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
              (position) => {
                const pos = {
                  lat: position.coords.latitude,
                  lng: position.coords.longitude,
                };
                infoWindow.setPosition(pos);
                infoWindow.setContent("현재위치입니다.");
                infoWindow.open(map);
                map.setCenter(pos);
              },
              () => {
                handleLocationError(true, infoWindow, map.getCenter());
              }
              );
          } else {
		      // Browser doesn't support Geolocation
		      handleLocationError(false, infoWindow, map.getCenter());
		    }
          });// END 현재 위치 찾기

        // 위치찾기 실패 예외처리----시작----
        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
          infoWindow.setPosition(pos);
          infoWindow.setContent(
            browserHasGeolocation
            ? "Error: The Geolocation service failed."
            : "Error: Your browser doesn't support geolocation."
            );
          infoWindow.open(map);
        }
        // 위치찾기 실패 예외처리----끝----
        
        // Create an array of alphabetical characters used to label the markers.
        const labels = "123456789";
        
        // Add some markers to the map.
        // Note: The code uses the JavaScript Array.prototype.map() method to
        // create an array of markers based on a given "locations" array.
        // The map() method here has nothing to do with the Google Maps API.
        const markers = locations.map((location, i) => {
          return new google.maps.Marker({
            position: location,
            label: labels[i % labels.length],
          });
        });
        
        // Add a marker clusterer to manage the markers.
        new MarkerClusterer(map, markers, {
          imagePath:
          "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",
        });
      }
      
      const locations = [
	      { lat: 37.521511, lng: 127.022927 },
	      { lat: 37.53406, lng: 127.002020 },
	      { lat: 37.53659215, lng: 127.000564816 },
	      { lat: 37.509024, lng: 127.0608686 },
	      { lat: 37.52888, lng: 126.964074 },
	      { lat: 37.525056, lng: 126.925368 },
	      { lat: 37.580900, lng: 126.980473 },
	      { lat: 37.564986, lng: 126.981397}
      ];
    </script>
</head>

<body>

  <header>
  <%@ include file="../index_header.jsp" %>
  </header>
  <div id="container">
  
    <div class="title-wrapper">
		<h1 class="title">스토어 찾기</h1>
	</div>
    <div class="store_location">
      <h2>28 Location</h2>
    </div>

    <table class="map_table">
      <tr>
        <td width="50%" class="active"><a href="${pageContext.request.contextPath}/search/store_search">Map</a></td>
        <td width="50%" class="active-none"><a href="${pageContext.request.contextPath}/search/store_search_list">Map List</a></td>
      </tr>
    </table>

    <div id="map_cover" style="width: px; height:800px;">
      <div id="map" style="width: 100%; height: 100%"></div>
    </div>

  </div>
  <footer>
  <%@ include file="../index_footer.jsp" %>
  </footer>
  <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>