<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<c:if test="${not empty errorMessage}">
    <div class="alert alert-danger">
        ${errorMessage}
    </div>
</c:if>


<div class="divWrap">
    <div class="top_search_area _searchKeywordView _searchGuide" style="">
        <div class="search_keyword_area _textPanel">
            <!-- 검색어 입력 필드 -->
            <input type="text" title="검색어 입력" value="" placeholder="정거장 검색" class="input_search_keyword _keyword" autocomplete="off" id="searchInput">
            <!-- 검색 버튼. 클릭 이벤트 리스너를 추가하기 위해 id를 추가 -->
            <span id="searchButton" style="cursor: pointer;"><i class="fas fa-search"></i></span>
        </div>
    </div>
    <div class="searchWrap" style="display:none;"> <!-- Initially hidden -->
        <div class="history_search hide" style="display: block;">
            <strong class="screen_out">검색 히스토리</strong>
            <ul class="list_history" id="searchResults">
                <!-- 검색 결과는 이곳에 표시 -->
            </ul>          
        </div>
    </div>
    <div class="routeWrap" style="display:none;"> <!-- Initially hidden -->
        <div class="history_route hide" style="display: block;">
            <strong class="screen_out">노선 히스토리</strong>
            <div class="summary">
	            <strong class="tit_summary" title="">
	            	<span class="busname"></span>
	            </strong>
	            <div class="infoEtc">
<!-- 		            <a href="#" class="ICON-fav"> -->
<!-- 			            <span class="img_BusLineView"><i class="far fa-star"></i></span> -->
<!-- 		            </a> -->
		            <a href="${pageContext.request.contextPath }/route/routeInfo.do?routeNm=도봉07" class="fit">
<%-- 		            <a href="${pageContext.request.contextPath }/route/routeInfo.do" class="fit"> --%>
		            	<span class="txt_fit">전체노선</span>
		            </a>
		            <div class="noRealBusBar">
		            	<p class="noReadlBusText"></p>
		            </div>
	            </div>
            </div>
            <ul class="list_route" id="routeResults">
                <!-- 노선은 이곳에 표시 -->
            </ul>          
        </div>
    </div>
</div>



<div id="map" style="width:600px;height:790px; border-top: 1px solid #ddd;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb220a45abe792f033fbc010f5b30024"></script>
<script>

    // 카카오 지도 API 스크립트 로드 후 실행되는 코드
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.54984878, 126.9147926),
        level: 3
    };

    // 마커가 표시될 위치
    var markerPosition = new kakao.maps.LatLng(37.54984878, 126.9147926); 

    // 마커를 생성
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정
    var map = new kakao.maps.Map(container, options);
    marker.setMap(map);

    // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성
    var iwContent = '<div style="padding:5px;">버스정거장 이름 <br> 버스번호 </div>', // 인포윈도우에 표출될 내용
        iwRemoveable = true; // 인포윈도우를 닫을 수 있는 x버튼이 표시

    // 인포윈도우를 생성
    var infowindow = new kakao.maps.InfoWindow({
        content: iwContent,
        removable: iwRemoveable
    });

 // 지도에 클릭 이벤트를 등록
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        var latlng = mouseEvent.latLng; 
        marker.setPosition(latlng);
        $.ajax({
            url: '<%=request.getContextPath()%>/bus/getBusStopInfo.do', 
            type: 'GET',
            data: {
                lat: latlng.getLat(),
                lng: latlng.getLng()
            },
            success:function(response){                
                let result = response.rst;
                console.log("체크 rst : ",response.rst);
                if(Array.isArray(result) && result.length > 0){
                    // 첫 번째 요소에서 정거장 이름을 가져옴
                    let nodeName = result[0].nodeNm;

                    // 모든 버스 번호를 저장할 배열을 선언
                    let routeNumbers = result.map(item => item.routeNm);                 

                    // 배열의 모든 버스 번호를 <br>로 결합
                    let routeNumbersStr = routeNumbers.join('<br>');

					// 인포윈도우에 표시할 내용을 설정하는 부분
					let contentString = '<div class="ndMmWrap"><strong class="ndNmStyle">' + nodeName + '</strong>';
					result.forEach(function(item) {
					    // FontAwesome 아이콘으로 변경
					    contentString += '<div class="ndNmInfo"><a href="javascript:void(0);" class="route_info" data-route-nm="' + item.routeNm + '" data-bus-id="' + item.busId + '">' + item.routeNm + '</a> <span class="favorite-icon" data-route-nm="' + item.routeNm + '" data-bus-id="' + item.busId + '"><i class="far fa-star"></i></span></div>';
					});
					contentString += '</div>';

					infowindow.setContent(contentString);
				
					// 버스 번호 클릭 이벤트 핸들러 등록
					$(document).on('click', '.route_info', function() {
						var routeNm = $(this).attr('data-route-nm'); 
						 $(".fit").attr("href", "${pageContext.request.contextPath}/route/routeInfo.do?routeNm=" + encodeURIComponent(routeNm));
					    console.log("체크 routeNm : ",routeNm);
					    $.ajax({
					        url: '<%=request.getContextPath()%>/bus/getBusRouteInfo.do',
					        type: 'GET',
					        data: { routeNm: routeNm },
					        success: function(response) {
					        	$(".busname").text(routeNm);
					        	
					            var routeInfo = '';
					            if(response.routeInfo && response.routeInfo.length > 0) {
					                response.routeInfo.forEach(function(item) {
					                	routeInfo += '<li><div class="bus_speed_info"><div class="before_speed grey"></div><div class="after_speed grey"></div><div class="center_direction"></div></div><a class="link_route" data-lat="' + item.lat + '" data-lng="' + item.lng + '">' + item.routeOrd + '. <strong>' + item.nodeNm + '</strong><br><span class="txt_route">' +  item.arsId  + '</span></a></li>';
					                });
					            } else {
					                // routeInfo 배열이 없거나 비어 있는 경우의 처리
					                alert("노선 정보가 없습니다."); // 사용자에게 알림창 표시
					                return; // 함수 실행 종료
					            }
					            $('#routeResults').html(routeInfo);
					            $('.routeWrap').show(); // 노선 정보 영역 표시
					        },
					        error: function(xhr, status, error) {
					            console.error("Ajax 요청 실패: ", status, error);
					        }
					    });
					
					});
					
					// 노선에서 버스번호 클릭 했을때 이벤트
					$(document).on('click', '.link_route', function() {
					    var lat = $(this).data('lat'); // 위도 값 가져오기
					    var lng = $(this).data('lng'); // 경도 값 가져오기
					    var newPos = new kakao.maps.LatLng(lat, lng); // 새 위치 객체 생성
					    
					    console.log("체크 노선 lat : ",lat);
					    console.log("체크 노선 lng : ",lng);

					    map.setCenter(newPos); // 지도의 중심을 새 위치로 이동

					    // 마커의 위치를 새 위치로 설정
					    marker.setPosition(newPos);
					    
					 // 노선결과 목록을 숨김
					    $('.routeWrap').hide(); 
					    
					    // 필요하다면 인포윈도우에 정보 표시 업데이트
					    infowindow.setContent('<div style="padding:5px;">' + $(this).text() + '</div>');
					    infowindow.open(map, marker);
					});


                    // 인포윈도우의 내용을 업데이트하고 열기
                    infowindow.setContent(contentString);
                    infowindow.open(map, marker);
                } else {          
                    infowindow.setContent('<div style="padding:5px;">정보가없습니다</div>');
                    infowindow.open(map, marker);            
                }
            },
            error: function(xhr, status, error) {
                console.error("Ajax 요청 실패:", status, error);
            }                   
        });
    });

</script>

<script>
	//검색 input 눌렀을때 이벤트
	document.getElementById('searchInput').addEventListener('focus', function() {
	    document.querySelector('.searchWrap').style.display = 'block';
	});
</script>
 
<script>
    // 검색 입력란에 포커스가 될 때 검색 이력을 보여주는 코드
    document.getElementById('searchInput').addEventListener('focus', function() {
        document.querySelector('.searchWrap').style.display = 'block';
    });

 	// 검색 결과 처리
    document.getElementById('searchButton').addEventListener('click', function() {
        var nodeNm = $('#searchInput').val(); // 사용자가 입력한 정거장명
        $.ajax({
            url: '/bus/searchBusStop.do',
            type: 'GET',
            data: { nodeNm: nodeNm },
            success: function(response) {
                let results = response.busStops;
                if (Array.isArray(results) && results.length > 0) {
                    var listItems = '';
                    results.forEach(function(item) {
                        listItems += '<li class="fst" data-type="busStop"><span class="history_ico ico_busStop"><span class="screen_out">버스정류장</span></span><a href="javascript:;" class="link_history" data-lat="' + item.lat + '" data-lng="' + item.lng + '">' + item.nodeNm + '</a></li>';
                    });
                    $('#searchResults').html(listItems);
                } else {
                    $('#searchResults').html('<li class="busEmpty">정거장이 없습니다</li>');
                }
                $('.searchWrap').show();
            },
            error: function(xhr, status, error) {
                console.error("Ajax 요청 실패:", status, error);
                alert('검색 처리 중 오류가 발생했습니다.');
            }
        });
    });

    // 클릭한 검색 결과 처리 	
	$('#searchResults').on('click', '.link_history', function() {
	    var lat = parseFloat($(this).data('lat')); // 위도값을 숫자로 변환
	    var lng = parseFloat($(this).data('lng')); // 경도값을 숫자로 변환
	    var newPos = new kakao.maps.LatLng(lat, lng); // 새 위치 객체를 생성
	    
	    console.log("체크 lat : ", lat);
	    console.log("체크 lng : ", lng);
	    
	    // 지도의 중심을 새 위치로 이동
	    map.setCenter(newPos);
	    
	    // 마커의 위치를 새 위치로 설정
	    marker.setPosition(newPos);
	    
	    // 검색 결과 목록을 숨김
	    $('.searchWrap').hide(); 
	
	    infowindow.setContent('<div style="padding:5px;">' + $(this).text() + '</div>');
	    infowindow.open(map, marker);
	});
    

    
    
    
    
	// 즐겨찾기 추가 이벤트
	$(document).on('click', '.favorite-icon', function() {
	    var self = this; // 현재 클릭된 요소
	    var busId = $(this).data('bus-id');
	    var userId = '${sessionScope.authId}';
	    var isFavorite = $(this).find('i').hasClass('fas'); // 즐겨찾기 상태 확인

	    // 즐겨찾기 추가 또는 해제 URL 설정
	    var url = isFavorite ? '<%=request.getContextPath()%>/bus/deleteBookmark.do' : '<%=request.getContextPath()%>/bus/insertBookmark.do';

	    $.ajax({
	        url: url,
	        type: 'POST',
	        dataType: 'json',
	        data: {
	            userId: userId,
	            busId: busId
	        },
	        success: function(response) {
	            // 즐겨찾기 상태 변경에 따라 별 색상 변경
	            if (response.message === "즐겨찾기에 추가되었습니다.") {
	                $(self).find('i').removeClass('far').addClass('fas'); // 노란색으로 변경
	            } else if (response.message === "즐겨찾기가 삭제되었습니다.") {
	                $(self).find('i').removeClass('fas').addClass('far'); // 흰색으로 변경
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("즐겨찾기 추가/삭제 요청 실패: ", error);
	            alert('즐겨찾기 처리 중 오류가 발생했습니다.');
	        }
	    });
	    return false; // 이벤트 버블링 방지
	});

	// 즐겨찾기 아이콘 초기 상태 설정
	$(document).ready(function() {
	    var userId = '${sessionScope.authId}';
	    $.ajax({
	        url: '<%=request.getContextPath()%>/bookmark/getBookmarks.do', 
	        type: 'GET',
	        data: { userId: userId },
	        success: function(response) {
	            var bookmarks = response.bookmarks; // 서버로부터 받은 즐겨찾기 목록
	            bookmarks.forEach(function(bookmark) {
	                // 각 즐겨찾기 항목에 대해 별 색상 변경 로직 적용
	                var selector = '.favorite-icon[data-bus-id="' + bookmark.busId + '"] > i';
	                $(selector).removeClass('far').addClass('fas'); // 별 색상을 노란색으로 변경
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error("즐겨찾기 목록 요청 실패: ", status, error);
	        }
	    });
	});





</script>


