<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%-- <%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%> --%> --%>



<!-- <div class="mobile_btn"> -->
<!-- 		<input type="checkbox" id="hamburger" /> -->
<!-- 		<label for="hamburger"> -->
<!-- 		  <span></span> -->
<!-- 		  <span></span> -->
<!-- 		  <span></span> -->
<!-- 		</label> -->
<!-- 		<div class="sidebar"> -->
<!-- 		    <ul class="nav_mobile"> -->
<%-- 		    <c:set value="<%= session.getAttribute(\"authId\")%>" var="user"/> --%>
<%-- 		    <c:choose> --%>
<%-- 			    <c:when test="${not empty user}"> --%>
<!-- 			        <li class="aside_profile_area"> -->
<!-- 			            <a href="#" class="aside_profile"> -->
<!-- 			                <div class="aside_profile_thumb">  -->
<!-- 			                    <img src="https://phinf.pstatic.net/contact/20221202_24/1669955019691eAnH0_PNG/profileImage.png?type=s160" width="36" height="36" class="NLogin_thumb_image _profile" alt=""> -->
<!-- 			                </div> -->
<!-- 			                <div class="aside_profile_info"> -->
<!-- 			                    <strong class="profile_nickname"> -->
<%-- 			                        <% String id = (String) session.getAttribute("authId");%> <%= id %> 님 --%>
<!-- 			                    </strong> -->
<!-- 			                </div> -->
<!-- 			            </a> -->
<!-- 			        </li>			       -->
<%-- 			    </c:when> --%>
<%-- 			    <c:otherwise> --%>
<!-- 			        <li class="aside_profile_area"> -->
<%-- 			            <a href="${pageContext.request.contextPath }/login.do" target="_blank"> --%>
<!-- 			                <span class="txt">로그인</span> -->
<!-- 			            </a> -->
<!-- 			        </li>	 -->
<%-- 			    </c:otherwise> --%>
<%-- 			</c:choose> --%>


		      
<!-- 		      <li> -->
<%-- 		      	<a href="${pageContext.request.contextPath }/bookmark.do" target="_blank">  --%>
<!-- 					<span class="txt">지도</span> -->
<!-- 				</a> -->
<!-- 		      </li> -->
<!-- 		      <li> -->
<%-- 		      	<a href="${pageContext.request.contextPath }/bookmark.do" target="_blank">  --%>
<!-- 					<span class="txt">길찾기</span> -->
<!-- 				</a> -->
<!-- 		      </li> -->
<!-- 		      <li> -->
<%-- 		      	<a href="${pageContext.request.contextPath }/bookmark.do" target="_blank">  --%>
<!-- 					<span class="txt">즐겨찾기</span> -->
<!-- 				</a> -->
<!-- 		      </li> -->
<!-- 		      <li> -->
<!-- <!-- 		      	<a onclick="submitForm();" href="javascript:;">  --> -->
<!-- <!-- 					<span class="txt">로그아웃</span> --> -->
<!-- <!-- 				</a> --> -->
				
<!-- 				<a href="#" onclick="submitForm();">  -->
<!-- 			        <span class="txt">로그아웃</span> -->
<!-- 			    </a> -->
<!-- 		      </li> -->
<!-- 		    </ul> -->
<!-- 		</div> -->
<!-- 		<h2>burin<span>map</span></h2> -->
<!-- </div> -->

<!-- <script> -->
// //로그아웃
// function submitForm() {
//     var form = $('<form>', {
//         'method': 'post',
//         'action': '/logoutProcess'
//     });
    
//     $('body').append(form); // 폼을 문서의 body에 추가
    
//     form.submit(); // 폼 제출
// }

<!-- </script> -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="header" style="background-color: green;">
	<div id="totalDiv" style="display: flex; justify-content: space-between;">
		<div id="logoDiv">
			<a href="/board/publicView.do" class="logo">등산어때</a>	
		</div>
	 	<div id="menuDiv">
		 	<ul class="menu">
			    <li><a href="/board/publicView.do"><img src="<%=request.getContextPath()%>/images/menu/home.png" alt="home"></a></li>
			    <li><a href="/board/partialView.do"><img src="<%=request.getContextPath()%>/images/menu/groups.png" alt="groups"></a></li>
			    <li><a href="/board/rBoardList.do"><img src="<%=request.getContextPath()%>/images/menu/mountain.png" alt="mountain"></a></li>
			    <li><a href="#"><img src="<%=request.getContextPath()%>/images/menu/medal.png" alt="medal"></a></li>
			</ul>
	  	</div>
	  	<div id="propileDiv">
	  		<img class="myProfile" src="/files/profile.do" alt="profile" 
	  			style="
		    			width: 40px;
		    			height: 40px;
		    			magin-top: 30px;
		    			padding-top: 15px;
		    			vertical-align: middle;
		    		  "
		    >
			
			<span id="userName" 
				style="
					display: inline-block;
			    	vertical-align: middle; /* 텍스트를 이미지에 수직 정렬 */
			    	margin-right: 5px;
			    	padding-top: 15px;
		    	"
		    >
		    <c:out value="${sessionScope.userNM}"/></span>	
	  	</div>
	</div>
</header>
