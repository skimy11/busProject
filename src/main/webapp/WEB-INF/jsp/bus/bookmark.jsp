<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="scroll_area divWrap">
	<ul id="bookmarkList" class="list_result">
<!-- 		즐겨찾기 리스트 내용 영역 -->
	</ul>
</div>

<script>
var userId = "${sessionScope.authId}"; // 세션에서 사용자 ID 가져오기

// 페이지 로드 시 즐겨찾기 목록을 가져오는 AJAX 요청
$(document).ready(function() {
    $.ajax({
        url: "<%=request.getContextPath()%>/bookmark/getBookmarks.do",
        type: "GET",
        data: {},
        success: function(response) {
            console.log("체크 response: ", response);
            
            var bookmarks = response.bookmarks || []; 
            // 즐겨찾기 목록이 비어있을 경우의 처리
            if (bookmarks.length === 0) {
                $('#bookmarkList').html('<li class="emtyTxt">즐겨찾기한 버스가 없습니다.</li>');
            } else {
                var listHtml = '';
                bookmarks.forEach(function(bookmark) {
                    listHtml += '<li class="sc-1puanzd fCMOZl item_result type_bus" data-bus-id="' + bookmark.busId + '"><div class="item_btn" role="button" tabindex="0"><div class="sc-zw8soy sc-k7ajlz eNBKEN bvbAsH"><span class="sc-rch11e kDBmYM"><span class="bus_icon">BUS</span><span class="bus_text">' + bookmark.routeNm + '</span></span></div></div><button type="button" class="btn_favorite_more"><i class="fas fa-star"></i></button></li>'; 
                });
                $('#bookmarkList').html(listHtml);
            }
        },
        error: function(xhr, status, error) {
            console.error("Error requesting bookmarks: ", status, error);
            alert('Failed to load bookmarks.');
        }
    });
});

// 즐겨찾기 삭제 버튼 클릭 이벤트
$(document).on('click', '.btn_favorite_more', function() {
    var self = this; // 현재 클릭된 요소에 대한 참조
    var busId = $(this).closest('.item_result').data('bus-id'); 
    console.log("체크 busId : ", busId); 
    
    // AJAX 요청으로 서버에 즐겨찾기 삭제 요청
    $.ajax({
        url: "<%=request.getContextPath()%>/bookmark/deleteBookmark.do",
        type: "POST",
        data: {
            userId: userId,
            busId: busId
        },
        success: function(response) {
            if(response === "SUCCESS") {
                $(self).closest('.item_result').remove(); // 삭제 성공 시 항목 제거
                alert('즐겨찾기에서 삭제되었습니다'); 
            } else {
                alert('Failed to delete the bookmark.');
            }
        },
        error: function(xhr, status, error) {
            console.error("Error deleting bookmark: ", status, error);
            alert('An error occurred while deleting the bookmark.');
        }
    });
});

//버스 텍스트 클릭 이벤트 핸들러
$(document).on('click', '.bus_text', function() {
    var routeNm = $(this).text(); // Get the text of the clicked element, which is the routeNm
    window.location.href = "<%=request.getContextPath()%>/route/routeInfo.do?routeNm=" + encodeURIComponent(routeNm); 
});

</script>

