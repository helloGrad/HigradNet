<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<base target="_self" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id" content="31840955156-0oh8u23d3t24v4rguka78knp12vo9jm4.apps.googleusercontent.com">


<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script> --%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>


<style>

.major-nav-box {
	height: 6em;
	border-bottom: 1px solid grey;
}

.navbar-left {
	font-weight: 400;
	padding-top: 15px;
	padding-bottom: 15px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 14px;
	letter-spacing: 5px;
}

.navbar-nav li a:hover {
	color: #1abc9c !important;
	background-color: white;
}


		
@media screen and (max-width: 400px) {
                
body {
    padding-top: 11em;
}  

             
}
@media screen and (min-width: 401px) and (max-width: 600px) {
               
   
body {
    padding-top: 11em;
}  

		
   
             
}
@media screen and (min-width: 801px) {
   
 body {
            padding-top: 7em;
 }	
 
                
}
    


</style>	
<script>
	
boardtype = "${boardtype}";
	
</script>
</head>


	<div class="w3-row" style="padding-top: 40px; height: 6em;">
    <div class="container">
        <div class="w3-container w3-margin-bottom">
            <div class="w3-xlarge w3-text-black subtitle" style="letter-spacing: 4px; text-shadow:1px 1px 0 green"></div>
        </div>
    </div>
</div>
<div class="container w3-margin-bottom">
    <div class="w3-bar">
        <button class="w3-col w3-button w3-white w3-text-blue" style="width:20%; font-size: 2vmin;">
            <a href="${pageContext.servletContext.contextPath }/study/main?boardtype=${boardtype}" style="text-decoration: none;">
                <i class="far fa-calendar-check"></i> 투데이</a>
        </button>

        <button class="w3-col w3-button w3-white" style="width:20%; font-size: 2vmin;">
            <a href="${pageContext.servletContext.contextPath }/study/notice?boardtype=${boardtype}" style="text-decoration: none;">
                <i class="far fa-users"></i> 모집공고</a>
        </button>

        <button class="w3-col w3-button w3-white" style="width:20%; font-size: 2vmin;">
            <a href="${pageContext.servletContext.contextPath }/study/discussion?boardtype=${boardtype}&ttype=A" style="text-decoration: none;">
                <i class="far fa-comments"></i> 토론</a>
        </button>

        <button class="w3-col w3-button w3-white" style="width:20%; font-size: 2vmin;">
            <a href="${pageContext.servletContext.contextPath }/study/research?boardtype=${boardtype}" style="text-decoration: none;">
                <i class="far fa-list-alt"></i> 연구과제</a>
        </button>

        <button class="w3-col w3-button w3-white" style="width:20%; font-size: 2vmin;">
            <a href="${pageContext.servletContext.contextPath }/study/lab?boardtype=${boardtype}" style="text-decoration: none;">
                <i class="far fa-flask"></i>  연구실</a>
        </button>
    </div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/study.js"></script>


		
		

