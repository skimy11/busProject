
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

	<div class="mobile_btn">
		<input type="checkbox" id="hamburger" />
		<label for="hamburger">
		  <span></span>
		  <span></span>
		  <span></span>
		</label>
		<div class="sidebar">
		    <ul class="nav_mobile">
		    <c:set value="<%= session.getAttribute(\"authId\")%>" var="user"/>
		    <c:choose>
			    <c:when test="${not empty user}">
			        <li class="aside_profile_area">
			            <a href="#" class="aside_profile">
			                <div class="aside_profile_thumb"> 
			                    <img src="https://static.nid.naver.com/images/web/user/default.png" width="36" height="36" class="NLogin_thumb_image _profile" alt="">
			                </div>
			                <div class="aside_profile_info">
			                    <strong class="profile_nickname">
			                        <% String id = (String) session.getAttribute("authId");%> <%= id %> 님
			                    </strong>
			                </div>
			            </a>
			        </li>			      
			    </c:when>
			    <c:otherwise>
			        <li class="aside_profile_area">
			            <a href="${pageContext.request.contextPath }/login.do">
			                <span class="txt"><i class="fa-solid fa-right-to-bracket"></i> 로그인</span>
			            </a>
			        </li>	
			    </c:otherwise>
			</c:choose>
			
		      <li>
		      	<a href="${pageContext.request.contextPath }/bus/main.do"> 
					<span class="txt"><i class="fa-solid fa-map"></i> 지도</span>
				</a>
		      </li>
		      <li>
		      	<a href="${pageContext.request.contextPath }/search/searchInfo.do"> 
					<span class="txt"><i class="fa-solid fa-bus"></i> 길찾기</span>
				</a>
		      </li>
		      <li>
		      	<a href="${pageContext.request.contextPath }/bookmark/bookmark.do"> 
					<span class="txt"><i class="fa-solid fa-star"></i> 즐겨찾기</span>
				</a>
		      </li>
		      <li>
		      	<a href="${pageContext.request.contextPath }/chart2/chart2Info.do"> 
					<span class="txt"><i class="fa-solid fa-area-chart"></i> 차트</span>
				</a>
		      </li>
		      <li>
		      	<a href="#" onclick="submitForm();"> 
			        <span class="txt"><i class="fa-solid fa-right-from-bracket"></i> 로그아웃</span>
			    </a>
		      </li>
		      
		    </ul>
		</div>
		<h2><a href="${pageContext.request.contextPath }/bus/main.do" style="line-height: 0.5;">burin<span>map</span></a></h2>
</div>


<script>
//로그아웃
function submitForm() {
    var form = $('<form>', {
        'method': 'post',
        'action': '/logoutProcess.do'
    });
    
    $('body').append(form); // 폼을 문서의 body에 추가
    
    form.submit(); // 폼 제출
}

</script>




