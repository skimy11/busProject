<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/headerStyle.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/leftSidebarStyle.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rightSideBarStyle.css">
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb220a45abe792f033fbc010f5b30024"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/css/ol.css" type="text/css">
<script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.9.0/build/ol.js"></script>

<style>
	 body, html {
	 		width : 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        .container {
            display: flex;
            flex-direction: column;
            min-height: 100%;
        }

        .contents {
            display: flex;
            flex-grow: 1;
        }

        #listBody {
            flex-grow: 1;
            overflow-y: scroll
        }
        #content{
        	/* word-wrap: break-word; */
        	display: flex;
		    justify-content: center;
		    padding-top: 120px;
		    padding-left: 260px;
		    padding-right: 260px;
		    background-color: red;
        }
	  
</style>
</head>
<body>
    <div class="container">

    	<div id="leftbar-wrapper">
	        <tiles:insertAttribute name="leftMenu" />
        </div>
        <div id="rightbar-wrapper">
            <tiles:insertAttribute name="rightMenu" />
        </div>
        <div class="contents">
            <tiles:insertAttribute name="headerMenu" />
            <div id="listBody">
                <tiles:insertAttribute name="content" />
            </div>
        </div>
    </div>
</body>
</html>