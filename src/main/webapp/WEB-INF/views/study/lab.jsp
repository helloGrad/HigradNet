<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script> --%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	

<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.min.css">
<link href="${pageContext.request.contextPath}/resources/css/study.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">

<style>
.headcolor {
	float: left;
	background-color: #eee;
	position: absolute;
	top: 0;
	right: 0;
	width: 100px;
	height: 380px;
}
.navigator_category {
	height: 44px;
	border: 1px solid #999;
	border-width: 1px 0;
	margin: 11px 0 11px 0;
	padding: 0 20px 0 0;
	font-family: "나눔고딕", "NanumGothic", "NanumGothicWebFont",
		"Malgun Gothic", "맑은 고딕", "Dotum", "돋움", "Helvetica",
		"Apple SD Gothic Neo", "sans-serif";
	font-size: 14px;
	line-height: 42px;
	color: #555;
}
.category_name {
	margin: 0 11px;
	font-family: "나눔고딕", "NanumGothic", "NanumGothicWebFont",
		"Malgun Gothic", "맑은 고딕", "Dotum", "돋움", "Helvetica",
		"Apple SD Gothic Neo", "sans-serif";
	font-size: 14px;
	line-height: 42px;
	color: #555;
}
ul {
	list-style: none;
}
.title-text {
	padding: 0;
	text-align: center;
}
.link-gray {
	color: DarkGray;
}
.link-title {
	margin: 30px 0 0 0;
	color: DimGrey;
	font-size: 18px;
}
h4, h6 {
	display: inline;
}
.list-color {
	background-color: #FBFBFB;
}
.area-title {
	float1: right;
	padding: 5px 10px;
}
.small-btn {
	font-size: 14px;
	border: 1px solid transparent;
	border-radius: 4px;
	padding: 6px 6px;
}
.tel-color {
	color: green;
}
.list-hr {
	border: 2px;
	border-top: solid 1px #CCC;
}

@media screen and (max-width: 400px) {
	.nopadding {
		padding: 0 !important;
		margin: 0 !important;
	}
	.small-btn {
		font-size: 10px;
		border: 1px solid transparent;
		border-radius: 4px;
		padding: 3px 3px;
	}
	.link-title {
		color: DimGrey;
		font-size: 15px;
	}
	.area-title {
		float1: right;
		padding: 5px 5px;
		font-size: 8px;
	}
@media screen and (min-width: 401px) and (max-width: 600px) {
		.nopadding {
			padding: 0 !important;
			margin: 0 !important;
		}
		.small-btn {
			font-size: 10px;
			border: 1px solid transparent;
			border-radius: 4px;
			padding: 3px 3px;
		}
		.link-title {
			color: DimGrey;
			font-size: 15px;
		}
		.area-title {
			float1: right;
			padding: 5px 5px;
			font-size: 8px;
		}
	}
@media screen and (min-width: 801px) {
		.nopadding {
			
		}
		.small-btn {
			font-size: 14px;
			border: 1px solid transparent;
			border-radius: 4px;
			padding: 6px 6px;
		}
		.link-title {
			color: DimGrey;
			font-size: 18px;
		}
	}
}
</style>
</head>
<body>
	
	
<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/subHeader.jsp" />


<div class="container">
            <div class="w3-row">
                <div class="w3-col s12 m12 l12">
                    <h5 class="w3-center" style="font-size: 4vmin;">연구실 리스트</h5>
                </div>

            </div>
        <div class="w3-row w3-row-padding">
            <c:set value="1" var="i" />
            <c:forEach items="${labList }" var="labVo" varStatus="status">
                <div class="w3-col s12 m12 l4 nopadding" style="margin-bottom: 3%;">
                    <div class="w3-card-2 w3-padding w3-hover-shadow">
                      <div class="w3-margin-top w3-border-bottom">
                            <button
                                    class="w3-button w3-white w3-border w3-border-green w3-round-large w3-center"  style="font-size: 1.7vmin;">${labVo.ar }</button>
                            <BR>
                            <div style="font-size: 2vmin; height: 4em;">
                                <span style="font-size: 2vmin;"><b style="font-size: 2vmin;">${labVo.orgnzNm }</b></span>
                                <c:choose>
                                    <c:when test="${empty labVo.university }">
                                        <span class="w3-text-grey" style="font-size: 1.1vmin;">${labVo.graduate }</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="w3-text-grey" style="font-size: 1.1vmin;">${labVo.university }</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <p class="w3-padding" style="height: 4em; font-size: 1.7vmin;">${labVo.addr }${labVo.detailAddr }</p>
                        <div class="w3-padding" style="height: 3em;">
                        <c:choose>
                            <c:when test="${empty labVo.hmpageUrl }">
                            </c:when>
                            <c:otherwise>
                                <button class="w3-button w3-white w3-border w3-border-blue w3-round-large w3-block w3-small"
                                        onclick="window.open('${labVo.hmpageUrl }')">홈페이지 바로가기</button>
                            </c:otherwise>
                        </c:choose>
                        </div>
                        <div class="w3-padding" style="height: 5em;">
                            <c:forEach items="${labCodeList }" var="codeVo"
                                       varStatus="status">
                                <c:if test="${codeVo.orgnzNo==labVo.orgnzNo }">
                                    <button class="w3-button w3-light-gray w3-padding w3-round-large"
                                            id="js-searchToggle" style="font-size: 0.7vmin;">${codeVo.cdNm }</button>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <c:set var="i" value="${i + 1}" />
            </c:forEach>


        </div>
    </div>
	
</body>
</html>