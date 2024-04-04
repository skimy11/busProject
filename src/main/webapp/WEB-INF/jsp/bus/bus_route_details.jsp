<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>노선 상세 정보</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb220a45abe792f033fbc010f5b30024"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        /* 여기에 스타일 추가 */
    </style>
</head>
<body>
    <div class="routeDetailWrap" style="display:none;">
    <div class="history_route">
        <strong class="screen_out">노선 상세 정보</strong>
        <div class="summary" style="border-bottom: 1px dotted #ddd;">
            <strong class="tit_summary" title="">
                <span class="busname"></span>
            </strong>
        </div>
        <ul class="list_route" id="routeResults">
            <!-- 노선 상세 정보는 여기에 표시됩니다. -->
        </ul> 
        <div id="roadview" class="roadViewCnt" style="width:100%;height:300px;"></div>         
    </div>
</div>
<c:if test="${not empty routeDetails}">
    <script>
        $(document).ready(function() {
            // 노선명 설정
            $(".busname").text("${routeDetails[0].routeNm}");

            // 노선 상세 정보를 HTML로 구성
            var routeHtml = '';
            <c:forEach items="${routeDetails}" var="detail" varStatus="status">
                routeHtml += '<li>' + 
                             '<div class="bus_speed_info"><div class="before_speed bfSpdStyle grey"></div><div class="after_speed speedStyle grey"></div><div class="center_direction directionStyle"></div></div><div class="link_route lnkRouteStyle">' +
                             '<span class="route_ord">${status.index + 1}.</span> ' +
                             '<strong class="node_nm">${detail.nodeNm}</strong>' +
                             '</div>' +
                             '</li>';
            </c:forEach>

            // 구성된 HTML을 routeDetailWrap 내부에 설정
            $("#routeResults").html(routeHtml);

            // 노선 정보 영역 표시
            $(".routeDetailWrap").show();
        });
	
		$(document).ready(function() {
		    // URL에서 쿼리 파라미터를 파싱하여 객체로 반환하는 함수
		    function getQueryParams() {
		        var params = {};
		        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) {
		            params[key] = decodeURIComponent(value);
		        });
		        return params;
		    }
		
		    var queryParams = getQueryParams();
		    var endStation = queryParams['endStation']; // URL 쿼리에서 endStation 값 가져오기
		
		    if (endStation) {
		        // endStation 값을 사용하여 서버에 AJAX 요청을 보냄
		        $.ajax({
		            url: '/search/getStationLocation.do',
		            type: 'GET',
		            dataType: 'text',
		            data: {
		                endStation: endStation
		            },
		            success: function(data) {
		            	 console.log("서버로부터 반환된 데이터: ", data); // 데이터 구조 확인
		            	 var parsedData = JSON.parse(data); // 문자열을 JSON 객체로 변환
		           	     var lat = parsedData.pointLat;
		            	 var lng = parsedData.pointLng;
		                
		                if (lat && lng) {
		                    // 정상적으로 위도와 경도를 받았을 때의 처리
		                    var position = new kakao.maps.LatLng(lat, lng);
		
		                    // 로드뷰를 표시할 div의 id를 'roadview'로 가정
		                    var roadviewContainer = document.getElementById('roadview');
		                    var roadview = new kakao.maps.Roadview(roadviewContainer);
		                    var roadviewClient = new kakao.maps.RoadviewClient();
		
		                    // 받은 position을 사용해 로드뷰 표시
		                    roadviewClient.getNearestPanoId(position, 50, function(panoId) {
		                        if (panoId) {
		                            roadview.setPanoId(panoId, position); // 로드뷰 실행
		                            console.log("로드뷰가 성공적으로 로드되었습니다.");
		                        } else {
		                            console.error("로드뷰 데이터가 해당 위치에 존재하지 않습니다.");
		                            // 여기에 사용자에게 표시할 메시지를 추가할 수 있습니다.
		                        }
		                    });
		                } else {
		                    console.error("위도 또는 경도 정보가 없습니다.");
		                }           
		            },
		            error: function(xhr, status, error) {
		                console.error("Error fetching station location: ", error);
		            }
		        });
		    }
		});
    </script>
</c:if>
</body>
</html>
