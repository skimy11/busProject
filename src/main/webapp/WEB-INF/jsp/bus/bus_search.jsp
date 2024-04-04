<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="insideWrap">
	<div class="inside_sch search_on">
        <fieldset>  
             <form id="searchForm" action="${pageContext.request.contextPath}/search/findRoute.do" method="get">
                <div class="search_route">
            	
	                <div class="box_search">	                    
	                	<input type="search" id="startQuery" name="startQuery" class="tf_keyword" value="" title="출발지 검색어 입력" placeholder="출발지 검색" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" maxlength="100">
	                </div>
            
                
	                <div class="box_search">
	                    <input type="search" id="endQuery" name="endQuery" class="tf_keyword" value="" title="도착지 검색어 입력" placeholder="도착지 검색" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" maxlength="100">
	                	<span id="" style="cursor: pointer;"><button type="submit" style="cursor: pointer;"><i class="fas fa-search"></i></button></span>
	                </div>
               
            	</div>
            </form>           
        </fieldset>
        
		<div>
		    <c:if test="${not empty routes}">
		        <ul class="list_section list_public" id="publicListBox">   
		            <c:forEach var="route" items="${routes}">
		                <li data-ranking="1" data-ptype="BUS" class="fst" data-licnt="1" data-all_cpg="1,1,1,1" data-bus_cpg="1,1,1,1">             
								<div class="public_info">
									<span class="txt_time left_padding">${route.estimatedTime}분</span> 
								</div>	            
								<a href="#" class="link_publicinfo">
									<span class="desc_public public_bus">                                                                                     
										<span class="ico_path "></span>                    
										<span class="txt_section">${route.startStation} 정류장</span>
									
										<span class="txt_g">                                                
											<span class="group_bus">
												<span class="numMAUL">
													 <a class="numStyle" href="${pageContext.request.contextPath}/search/showRouteDetails.do?routeId=${route.routeId}&startStation=${route.startStation}&endStation=${route.endStation}">
									                	<span class="bus_icon">BUS</span><span class="route_number">${route.routeNm}</span>
									            	</a>
												</span>
											</span>
										</span>
									</span>                                                                                        
									<span class="desc_public public_bus">                                                                                     
										<span class="ico_path ico_alight">하차</span>
										<em class="screen_out">장소</em>                     
										<span class="txt_section">${route.endStation} 정류장</span>
								   
										<span class="txt_g"></span>
									</span>
								</a>
							</li>
		            </c:forEach>
		        </ul>
		    </c:if>
		    <c:if test="${empty routes and searchPerformed}">
		        <p class="searchEmpty">해당 버스가 없습니다.</p>
		    </c:if>
		</div>

    </div>
    <div class="searchEmptyTxt">출발지/도착지를 입력하세요</div>
</div>


