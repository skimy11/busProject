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
<title>burinmap</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>



       




<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/egovframework/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/egovframework/login.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/egovframework/tiles.css">



</head>
<body>
    <div class="container">
        <div class="contents" style="height: 100vh;">
            <tiles:insertAttribute name="headerMenu" />
            <div id="listBody">
                <tiles:insertAttribute name="content" />
            </div>
        </div>
    </div>
</body>
</html>