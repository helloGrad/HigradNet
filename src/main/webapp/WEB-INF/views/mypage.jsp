<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>하이그래드넷</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/antimoderate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/antimoder.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script> --%>

<style>
.row {
	clear: both;
}

.jumbotron {
	position: relative;
	z-index: 1;
	height: 25em;
	margin-bottom: 0.1em;
	text-align: center;
	background-size: cover;
}

.user-info {
	color: #FFFFFF;
	padding-top: 4em;
}

.user-info-box {
	background-color: rgba(78, 18, 201, 0.8) !important;
	height: 20em;
}

.user-info-list {
	float: left;
	margin-left: 1em;
	color: #FFFFFF;
	font-size: 1.2em;
	list-style-type: none;
}

.user-info-weight {
	font-weight: 100;
	margin-left: 0.5em;
}

.user-info-list-box {
	border: 1px solid #f0f0f0;
	width: 100%;
	height: 100%;
}

.navbar {
	background-color: rgba(255, 255, 255, 0.95);
}

.navbar-qna {
	font-weight: 400;
	margin-top: -5px;
	margin-bottom: -5px;
	margin-left: -1em;
	font-size: 1.5vmin;
	letter-spacing: 4px;
	float: left;
}

.navbar-nav li a:hover {
	color: #1abc9c !important;
	background-color: white;
}

.grad-background-color {
	background-color: rgb(247, 245, 242);
}

body {
	padding-top: 5em;
}

.qna-banner {
	box-shadow: 5px 10px 10px rgba(0, 0, 51, 0.3), -1px -1px 10px
		rgba(0, 0, 51, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}

.qna-banner:hover {
	box-shadow: 5px 10px 30px rgba(0, 0, 51, 0.5), -1px -1px 30px
		rgba(0, 0, 51, 0.5);
	margin-bottom: 1.5em;
}

.grad-banner {
	box-shadow: 3px 3px 10px rgba(179, 0, 0, 0.3), -1px -1px 10px
		rgba(255, 153, 153, 0.3);

}

.lab-banner {
	box-shadow: 3px 3px 10px rgba(0, 0, 255, 0.3), -1px -1px 10px
		rgba(217, 179, 255, 0.3);
	margin-bottom: 1.5em;
}

.conf-banner {
	box-shadow: 3px 3px 10px rgba(0, 128, 0, 0.3), -1px -1px 10px
		rgba(179, 230, 179, 0.3);
	margin-bottom: 1.5em;
}

.short-cut {
	text-decoration: none;
	color: gray;
}

.short-cut:hover {
	color: indianred;
}

.content-answers {
	height: 3.5em;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: normal;
}

.grad-banner-our {
	box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.15), -1px -1px 10px
		rgba(0, 0, 0, 0.15);
	margin-bottom: 1.5em;
	background-color: white;
}

.scrap-on {
	color: #FF0000;
}
</style>

<script type="text/javascript">

$(function() {
	
	var authUser = $("#mbNo").val();
	
	if(authUser == null || authUser == "" ){
	}else{
		
		var scrapList=JSON.parse('${scrapList}');
		for(var i=0;i<scrapList.length;i++){
			if(scrapList[i].prntsDstnct==='모집공고'){ 
				$('.do-scrapnoti' + scrapList[i].prntsNo).addClass('w3-text-red');
				$('.scrapnoti' + scrapList[i].prntsNo).removeClass('w3-card');
				$('.scrapnoti' + scrapList[i].prntsNo).addClass('grad-banner');
			}
		};	
		
	};
	
	
	var mypageText=$(".mypage-text");
	var readMore=$(".read-more");
	
	for(var i=0;i<mypageText.length;i++){
		if($(mypageText[i]).height() < 147){
			$(readMore[i]).empty();
		}
	}
	
	$(document).on(
			'click',
			".counseling",
			function(event) {

				click_id = $(this).attr('value');
				

				if (authUser === null || authUser === '') {

					$("#loginForm").css({
						"display" : "block"
					});

				} else {

					location.href = "/net/counseling/detail?no=" + click_id
							+ "&type=prnts";

				}

			});

	$(document).on(
			'click',
			".counselingreply",
			function() {

				click_id = $(this).attr('value');

				
				if (authUser === null || authUser === '') {

					$("#loginForm").css({
						"display" : "block"
					});

				} else {

					location.href = "/net/counseling/detail?no=" + click_id
							+ "&type=reply";
					event.stoplmmediatePropagation();
				}

			});
	
		
});



function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}




</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />



	<!--sub navigation-->
	<div class="w3-panel">
		<c:if test="${type!='myscrap' }">
			<h1 class="w3-center" style="letter-spacing: 5px;">${authUser.nknm }'s
				PROFILE</h1>
		</c:if>
		<div class="container">
			<input id='mbNo' type="hidden" value="${authUser.mbNo }"> <input
				id='type' type="hidden" value="${type }">

			<!-- 패널 시작-->
			<c:if test="${type!='myscrap' }">
				<div class="w3-row">
					<div class="w3-row-padding w3-container">
						<div
							class="w3-col s12 m12 l12  w3-white w3-round-large main-banner">
							<div class="w3-col s12 m4 l4">
								<h5 class="w3-center w3-padding " style="letter-spacing: 0.3em;">
									<strong>I am</strong>
								</h5>
								<p>
									<i
										class="fas fa-graduation-cap fa-fw w3-margin-right w3-text-theme"></i>
									<c:set var="cindex" value='0' />
									<c:forEach var='infoList' items='${infoList }'
										varStatus="status">
										<c:if test="${infoList.cdDstnct=='학문' }">

											<c:if test="${cindex=='0'}">
										${infoList.cdNm }
										</c:if>
											<c:if test="${cindex!='0' }">
										/${infoList.cdNm }
										</c:if>

											<c:set var="cindex" value='1' />
										</c:if>

									</c:forEach>
									<c:if test="${cindex=='0' }">분야 미설정</c:if>

									<c:set var="cindex" value='0' />
									<c:forEach var='infoList' items='${infoList }'
										varStatus="status">
										<c:if test="${infoList.cdDstnct=='연구분야' }">

											<c:if test="${cindex=='0'}">
										${infoList.cdNm }
										</c:if>
											<c:if test="${cindex!='0' }">
										/${infoList.cdNm }
										</c:if>

											<c:set var="cindex" value='1' />
										</c:if>
									</c:forEach>
									<c:if test="${cindex=='0' }">연구분야 미설정</c:if>

								</p>
								<p>
									<i class="fas fa-home fa-fw w3-margin-right w3-text-theme"></i>

									<c:set var="cindex" value='0' />
									<c:forEach var='infoList' items='${infoList }'
										varStatus="status">

										<c:if test="${infoList.cdDstnct=='방문목적' }">

											<c:if test="${cindex=='0'}">
										${infoList.cdNm }
										</c:if>
											<c:if test="${cindex!='0' }">
										/${infoList.cdNm }
										</c:if>

											<c:set var="cindex" value='1' />
										</c:if>

									</c:forEach>
									<c:if test="${cindex=='0' }">방문목적 미설정</c:if>
								</p>
								<p>
									<i
										class="fas fa-map-marker-alt fa-fw w3-margin-right w3-text-theme"></i>
									<c:set var="cindex" value='0' />
									<c:forEach var='infoList' items='${infoList }'
										varStatus="status">

										<c:if test="${infoList.cdDstnct=='지역' }">

											<c:if test="${cindex=='0'}">
										${infoList.cdNm }
										</c:if>
											<c:if test="${cindex!='0' }">
										/${infoList.cdNm }
										</c:if>

											<c:set var="cindex" value='1' />
										</c:if>

									</c:forEach>
									<c:if test="${cindex=='0' }">전국</c:if>
								</p>
							</div>


							<div class="w3-col s12 m4 l4">
								<h5 class="w3-center w3-padding" style="letter-spacing: 0.3em;">
									<strong>Activity</strong>
								</h5>
								<p
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage?type=myboard&btype=원글'">
									<i class="fas fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
									작성 내역
								</p>
								<p
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage?type=myboard&btype=답글'">
									<i class="fas fa-reply fa-fw w3-margin-right w3-text-theme"></i>
									답변 내역
								</p>
								<p
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage?type=myscrap'">
									<i class="fas fa-thumbtack fa-fw w3-margin-right w3-text-theme"></i>
									스크랩
								</p>
							</div>
							<div class="w3-col s12 m4 l4 w3-center">
								<h5 class="w3-center w3-padding" style="letter-spacing: 0.3em;">
									<strong>Setting</strong>
								</h5>

								<p>
									<a
										href="${pageContext.servletContext.contextPath }/user/setting">
										EDIT </a>
								<p>
							</div>
						</div>

						<div class="w3-col s12 m6 l9 w3-white w3-round-large main-banner">

						</div>
					</div>
				</div>

				<!-- 패널 끝 -->
				<div class="w3-row">
					<div class="w3-bar w3-round-large">

						<c:choose>
							<c:when test="${type=='noti' }">
								<button class="w3-bar-item w3-button w3-margin-left w3-large "
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage'">
									<i class="fas fa-newspaper"></i> TODAY
								</button>
								<button class="w3-bar-item w3-button w3-large w3-text-blue"
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage?type=noti'">
									<i class="fas fa-users w3-text-grey"></i> RECRUIT
								</button>
							</c:when>
							<c:when test="${type == '-1' }">
								<button
									class="w3-bar-item w3-button w3-margin-left w3-large w3-text-blue"
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage'">
									<i class="fas fa-newspaper"></i> TODAY
								</button>
								<button class="w3-bar-item w3-button w3-large"
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage?type=noti'">
									<i class="fas fa-users w3-text-grey"></i> RECRUIT
								</button>
							</c:when>
							<c:otherwise>
								<button class="w3-bar-item w3-button w3-margin-left w3-large "
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage'">
									<i class="fas fa-newspaper"></i> TODAY
								</button>
								<button class="w3-bar-item w3-button w3-large "
									onclick="window.location.href='${pageContext.request.contextPath}/user/mypage?type=noti'">
									<i class="fas fa-users w3-text-grey"></i> RECRUIT
								</button>
							</c:otherwise>
						</c:choose>


					</div>
				</div>

			</c:if>

			<!-- 내가 쓴글 -->

			<c:if test="${type == 'myboard' }">


				<div class="w3-row">
					<div class="w3-row-padding">
						<div
							class="w3-card w3-white w3-round-large w3-margin-bottom w3-content"
							style="max-width: 800px;">
							<!--게시글-->
							<div class="w3-col s12 m12 l12 w3-margin-bottom ">

								<c:forEach items="${BoardList }" var="BoardList"
									varStatus="status">
									<c:set var="name" value="${BoardList.slctnNotiDstnct}" />
									<c:set var="leng" value="${fn:length(name)}" />
									<c:if test="${BoardList.wrtbtTypeDstnct == btype}">

										<c:if test="${BoardList.slctnEndDt == 9999 }">

											<c:if test="${btype=='원글' }">
												<div
													class="w3-card w3-round-large w3-margin-bottom w3-white talk-banner counseling"
													value="${BoardList.slctnNotiNo }">
											</c:if>
											<c:if test="${btype=='답글' }">
												<div
													class="w3-card w3-round-large w3-margin-bottom w3-white talk-banner counselingreply"
													value="${BoardList.prntsWrtbtNo }">
											</c:if>

											<div class="w3-padding w3-text-grey w3-small">
												<span class=""> <c:if
														test="${BoardList.slctnNotiDstnct=='상담게시판' }">
											Question Asked
										</c:if> <c:if test="${BoardList.slctnNotiDstnct=='일반게시판' }">
											Ordinary
										</c:if> - ${fn:replace(BoardList.bbsNm,'게시판','') }
												</span> <span class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
											</div>




											<!-- 이미지가 있는 경우 -->
											<c:if test="${BoardList.storgPath ne null }">

												<div class="w3-margin-left">
													<h5 style="margin-bottom: 0em;">

														<c:if test="${BoardList.slctnNotiDstnct=='상담게시판' }">
															<i class="far fa-question fa-lg"></i>
														</c:if>
														<c:if test="${BoardList.slctnNotiDstnct=='일반게시판' }">
															<i class="far fa-sun fa-lg"></i>
														</c:if>
														<strong><c:if test="${btype=='답글' }">
															${BoardList.ptitle }
														</c:if> <c:if test="${btype=='원글' }">
															${BoardList.wrtbtTitle }
														</c:if></strong>
													</h5>
												</div>
												<div class="w3-display-container">

													<img  class='anti' class='anti' src="${BoardList.storgPath }" alt=""
														style="width: 100%;">

													<!--제목-->
													<div
														class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
														style="background-color: rgba(0, 0, 0, 0.5);">#${BoardList.wrtbtTitle
														}</div>
												</div>
											</c:if>


											<!-- 이미지가 없는 경우 -->
											<c:if test="${BoardList.storgPath eq null }">
												<div class="w3-center w3-container">
													<h5 style="margin-bottom: 0em;">
														<strong> <c:if test="${btype=='답글' }">
															${BoardList.ptitle }
														</c:if> <c:if test="${btype=='원글' }">
															${BoardList.wrtbtTitle }
														</c:if>
														</strong>
													</h5>
												</div>

												<c:if test="${btype=='원글' }">
													<div class="w3-container" style="margin-bottom: -1em;">
														<div class="w3-container w3-margin-top">


															<p class="w3-medium mypage-text"
																style="margin-top: 0em; line-height: 200%; max-height: 10em; text-overflow: ellipsis; overflow: hidden;">
																${BoardList.wrtbtText }</p>
															<span
																class="w3-medium w3-left w3-margin-bottom w3-text-blue read-more"
																style="font-size: 1.8vmin; margin-top: -1.5em;">(read
																more)</span>


														</div>
													</div>
												</c:if>
											</c:if>



											<c:if test="${BoardList.count>0 }">
												<div class="w3-container w3-margin-top">
													<!--코멘트 수-->
													<span class="w3-small w3-padding"> <c:if
															test="${fn:substring(name,0,2) =='상담'}">
													Answer
												</c:if> <c:if test="${fn:substring(name,0,2) !='상담' }">
													Comment
												</c:if> <span class="w3-badge w3-light-gray">${BoardList.count }</span>
													</span>
													<!--코멘트(베스트)-->

													<p class="board-answer w3-round-large w3-padding w3-medium"
														style="font-size: 1.8vmin; margin-top: 0em; line-height: 200%; max-height: 4em; text-overflow: ellipsis; overflow: hidden;">
														${BoardList.subwrtbtText }</p>

												</div>
											</c:if>
											<c:if test="${BoardList.count <=0 }">
												<div class="w3-container w3-margin-top"></div>
											</c:if>

											<c:if
												test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 && btype=='원글'}">
												<div class="w3-container w3-center w3-padding">
													<button
														class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply"
														style="letter-spacing: 2px;"
														value="${BoardList.slctnNotiNo}">답변하기</button>
												</div>
											</c:if>
							</div>
			</c:if>

			<c:if
				test="${BoardList.slctnEndDt != 9999 && BoardList.slctnEndDt != null && btype=='원글'}">
				<div
					class="w3-card w3-round-large w3-margin-bottom w3-white talk-banner "">

					<div class='w3-container w3-padding w3-text-light-grey'>
						<div class='w3-container w3-padding w3-text-light-grey'>
							<h4>
								<b>사용자에 의해 삭제된 게시물입니다.</b>
							</h4>
						</div>
					</div>
				</div>
			</c:if>
			</c:if>



			</c:forEach>


		</div>
	</div>

	</div>
	</div>
	</c:if>

	<!-- 내가 쓴글 끝-->

	<!-- 모집공고, 새소식 시작 -->

	<c:if test="${type == '-1' || type == 'noti' }">

		<c:forEach items="${calList }" var="calList">
			<div class="w3-row">
				<div class="w3-panel w3-border-bottom w3-border-black">
					<h1>
						<div style="float: left; margin-right: 0.3em; line-height: 90%;">${calList.day }</div>
						<small>
							<div style="float: left; font-size: small; line-height: 130%;">
								${calList.week }<br>${calList.year }년 ${calList.month }월
							</div>
						</small>
					</h1>
				</div>

				<div class="w3-row-padding">

					<!--lane 1-->

					<div class="w3-col s12 m6 l4 w3-row-padding w3-margin-bottom">
						<c:forEach items="${BoardList }" var="BoardList"
							varStatus="status">
							<c:set var="name" value="${BoardList.slctnNotiDstnct}" />
							<c:set var="leng" value="${fn:length(name)}" />
							<c:if
								test="${BoardList.no%3==1 && calList.month==BoardList.month && calList.day==BoardList.day }">


								<!-- 대학원 유료 -->
								<c:if
									test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-card w3-margin-bottom scrapnoti${BoardList.slctnNotiNo }">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year}년
												${BoardList.slctnSemstr}</div>
											<div style="margin-bottom: 0em;">
												<img class='anti' class='anti' src="${BoardList.storgPath }" alt="${BoardList.major }"
													style="width: 100%; padding: 1em 1em 0 1em; height: 83px;">
											</div>
											<div class="w3-container w3-center">
												<h4>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">
													<span class="grad-target">${BoardList.slctnTitle }</span>
												</p>
											</div>
											<div class="w3-container">
												<div class="w3-light-grey w3-tiny">
													<c:if test="${BoardList.percent<=0 }">
														<div class="w3-container" style="width: 0%; height: 1px;"></div>
													</c:if>
													<c:if test="${BoardList.percent>0 }">
														<div class="w3-container w3-black"
															style="width: ${BoardList.percent }%; height: 1px;"></div>
													</c:if>
												</div>
											</div>

										</div>

										<div class="w3-container w3-margin-top">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
										</div>

										<div class="w3-row-padding w3-padding">
											<span
												class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
												style="float: right;"> <c:choose>
													<c:when test="${BoardList.slctnYycl=='9999' }">
														<div class="noti-endtext">상시모집</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
														<div class="noti-endtext">모집예정</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
														<div class="noti-endtext">D-${labVo.dday}</div>
													</c:when>
													<c:when test="${BoardList.dday == 0 }">
														<div class="noti-endtext">오늘마감</div>
													</c:when>
													<c:when test="${BoardList.dday < 0 }">
														<div class="noti-endtext">모집마감</div>
													</c:when>
												</c:choose>

											</span>
										</div>
									</div>
								</c:if>

								<!-- 연구실 유료 -->
								<c:if
									test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									<div
										class="w3-display-container w3-round-large w3-white w3-card w3-margin-bottom scrapnoti${BoardList.slctnNotiNo }">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">
												<c:choose>
													<c:when test="${BoardList.bk21EorgnzSuprtYn =='Y' }">
														<div class="w3-small"
															style="margin-bottom: -1.5em; height: 2.7em">
															<span class="w3-text-white w3-round-large"
																style="background: linear-gradient(141deg, rgba(255, 0, 0, 1), rgba(0, 0, 255, 1));">&nbsp;BK
																21+&nbsp;</span>
														</div>
													</c:when>
													<c:otherwise>
														<span
															style="padding-right: 2px; padding-left: 10px; margin-right: -5px"></span>
														<span style="padding-right: 5px; padding-left: 0px;"></span>
													</c:otherwise>
												</c:choose>
											</div>
											<div style="margin-bottom: 0em;">
												<img class='anti' class='anti' src="${BoardList.storgPath }" alt="${BoardList.major }"
													style="width: 100%; padding: 1em 1em 0 1em; height: 83px;">
											</div>
											<div class="w3-container w3-center">
												<h4>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">
													<span class="grad-target">${BoardList.slctnTitle }</span>
												</p>
											</div>

											<div class="research-field w3-padding text-center">
												<c:forEach items="${BoardList.researchList }" var="resList"
													varStatus="status">
													<span class="w3-tag w3-light-grey w3-tiny ">${resList.cdNm }</span>
												</c:forEach>
											</div>
										</div>
										<div
											class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
											<i class="far fa-thumbtack w3-large"
												onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
										</div>
										<div class="w3-row-padding w3-padding">
											<span
												class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
												style="float: right;"> <c:choose>
													<c:when test="${BoardList.slctnYycl=='9999' }">
														<div class="noti-endtext">상시모집</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
														<div class="noti-endtext">모집예정</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
														<div class="noti-endtext">D-${labVo.dday}</div>
													</c:when>
													<c:when test="${BoardList.dday == 0 }">
														<div class="noti-endtext">오늘마감</div>
													</c:when>
													<c:when test="${BoardList.dday < 0 }">
														<div class="noti-endtext">모집마감</div>
													</c:when>
												</c:choose>

											</span>
										</div>
									</div>
								</c:if>

								<!-- 대학원 무료-->
								<c:if
									test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-margin-bottom  w3-card scrapnoti${BoardList.slctnNotiNo }">

										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year }년
												${BoardList.slctnSemstr}</div>
											<div class="w3-container w3-center w3-padding"
												style="margin-bottom: -1em;">
												<h4 class="w3-padding w3-round-large"
													style="margin-bottom: 0em;">
													<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
											</div>
										</div>
										<div class="w3-row-padding w3-padding">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
											<div class="w3-row-padding w3-padding">
												<span
													class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
													style="float: right;"> <c:choose>
														<c:when test="${BoardList.slctnYycl=='9999' }">
															<div class="noti-endtext">상시모집</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
															<div class="noti-endtext">모집예정</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
															<div class="noti-endtext">D-${labVo.dday}</div>
														</c:when>
														<c:when test="${BoardList.dday == 0 }">
															<div class="noti-endtext">오늘마감</div>
														</c:when>
														<c:when test="${BoardList.dday < 0 }">
															<div class="noti-endtext">모집마감</div>
														</c:when>
													</c:choose>
												</span>
											</div>
										</div>
									</div>

								</c:if>


								<!-- 연구실 무료-->

								<c:if
									test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }"
										onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year }년
												${BoardList.slctnSemstr }</div>
											<div class="w3-container w3-center w3-padding"
												style="margin-bottom: -1em;">
												<h5 class="w3-padding" style="margin-bottom: 0em;">
													<strong style="color: ${BoardList.symbolColorNm };">${BoardList.university }
													</strong>
												</h5>
												<h5>
													<strong>${BoardList.graduate } ${BoardList.lab }</strong>
												</h5>
												<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
											</div>
										</div>
										<div class="w3-row-padding w3-padding">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
											<div class="w3-row-padding w3-padding">
												<span
													class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
													style="float: right;"> <c:choose>
														<c:when test="${BoardList.slctnYycl=='9999' }">
															<div class="noti-endtext">상시모집</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
															<div class="noti-endtext">모집예정</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
															<div class="noti-endtext">D-${labVo.dday}</div>
														</c:when>
														<c:when test="${BoardList.dday == 0 }">
															<div class="noti-endtext">오늘마감</div>
														</c:when>
														<c:when test="${BoardList.dday < 0 }">
															<div class="noti-endtext">모집마감</div>
														</c:when>
													</c:choose>
												</span>
											</div>
										</div>
									</div>
								</c:if>


								<!-- 게시글 -->
								<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">

									<c:if test="${BoardList.slctnEndDt == 9999 }">

										<div
											class="w3-card w3-round-large w3-margin-bottom main-banner w3-white counseling"
											value=${BoardList.slctnNotiNo }>
											<div class="w3-padding w3-text-grey w3-small">
												<span class="">${fn:replace(BoardList.bbsNm,'게시판','') }
													- <c:if test="${fn:substring(name,0,2) =='상담'}">
												Question
											</c:if> <c:if test="${fn:substring(name,0,2) !='상담' }">
												Ordinary
											</c:if> - <c:if test="${BoardList.storgPath ne null }">
												with Image                    	
											</c:if> <c:if test="${BoardList.storgPath eq null }">
												no Image
											</c:if>
												</span>
											</div>



											<!-- 이미지가 있는 경우 -->
											<c:if test="${BoardList.storgPath ne null }">
												<div class="w3-display-container">
													<img class='anti' class='anti' src="${BoardList.storgPath }" alt=""
														style="width: 100%;">

													<!--제목-->
													<div
														class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
														style="background-color: rgba(0, 0, 0, 0.5);">#${BoardList.wrtbtTitle
														}</div>
												</div>
											</c:if>


											<!-- 이미지가 없는 경우 -->
											<c:if test="${BoardList.storgPath eq null }">
												<div class="w3-center w3-container">
													<h5 style="margin-bottom: 0em;">
														<strong>${BoardList.wrtbtTitle }</strong>
													</h5>
												</div>
												<div class="w3-container" style="margin-bottom: -1em;">
													<div class="w3-container w3-margin-top">
														<p class="w3-medium mypage-text"
															style="margin-top: 0em; line-height: 200%; max-height: 10em; text-overflow: ellipsis; overflow: hidden;">
															${BoardList.wrtbtText }</p>
														<span
															class="w3-medium w3-left w3-margin-bottom w3-text-blue read-more"
															style="font-size: 1.8vmin; margin-top: -1.5em;">(read
															more)</span>
													</div>
												</div>
											</c:if>

											<c:if
												test="${BoardList.subSlctnEndDt == 9999 || BoardList.subSlctnEndDt == null }">

												<c:if test="${BoardList.count>0 }">
													<div class="w3-container w3-margin-top">
														<!--코멘트 수-->
														<span class="w3-small w3-padding"> <c:if
																test="${fn:substring(name,0,2) =='상담'}">
													Answer
												</c:if> <c:if test="${fn:substring(name,0,2) !='상담' }">
													Comment
												</c:if> <span class="w3-badge w3-light-gray">${BoardList.count }</span>
														</span>
														<!--코멘트(베스트)-->
														<p
															class="board-answer w3-round-large w3-padding w3-medium"
															style="font-size: 1.8vmin; margin-top: 0em; line-height: 200%; max-height: 4em; text-overflow: ellipsis; overflow: hidden;">
															${BoardList.subwrtbtText }</p>
													</div>
												</c:if>
												<c:if test="${BoardList.count <=0 }">
													<div class="w3-container w3-margin-top"></div>
												</c:if>


											</c:if>


											<c:if
												test="${BoardList.subSlctnEndDt != 9999 && BoardList.subSlctnEndDt != null }">

												<div class='w3-container w3-padding w3-text-light-grey'>
													<h4>
														<b>사용자에 의해 삭제된 게시물입니다.</b>
													</h4>
												</div>

											</c:if>

											<c:if
												test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
												<div class="w3-container w3-center w3-padding">
													<button
														class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply"
														style="letter-spacing: 2px;"
														value="${BoardList.slctnNotiNo}">답변하기</button>
												</div>
											</c:if>
										</div>
									</c:if>




									<c:if test="${BoardList.slctnEndDt != 9999}">
						
									</c:if>




								</c:if>



								<!-- 게시글 끝 -->

							</c:if>
						</c:forEach>

					</div>

					<!--lane 2-->
					<div class="w3-col s12 m6 l4 w3-row-padding w3-margin-bottom">
						<c:forEach items="${BoardList }" var="BoardList"
							varStatus="status">
							<c:set var="name" value="${BoardList.slctnNotiDstnct}" />
							<c:set var="leng" value="${fn:length(name)}" />
							<c:if
								test="${BoardList.no%3==2 && calList.month==BoardList.month && calList.day==BoardList.day }">


								<!-- 대학원 유료 -->
								<c:if
									test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-card w3-margin-bottom scrapnoti${BoardList.slctnNotiNo }">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year}년
												${BoardList.slctnSemstr}</div>
											<div style="margin-bottom: 0em;">
												<img  class='anti' src="${BoardList.storgPath }" alt="${BoardList.major }"
													style="width: 100%; padding: 1em 1em 0 1em; height: 83px;">
											</div>
											<div class="w3-container w3-center">
												<h4>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">
													<span class="grad-target">${BoardList.slctnTitle }</span>
												</p>
											</div>
											<div class="w3-container">
												<div class="w3-light-grey w3-tiny">
													<c:if test="${BoardList.percent<=0 }">
														<div class="w3-container" style="width: 0%; height: 1px;"></div>
													</c:if>
													<c:if test="${BoardList.percent>0 }">
														<div class="w3-container w3-black"
															style="width: ${BoardList.percent }%; height: 1px;"></div>
													</c:if>
												</div>
											</div>

										</div>

										<div class="w3-container w3-margin-top">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
										</div>

										<div class="w3-row-padding w3-padding">
											<span
												class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
												style="float: right;"> <c:choose>
													<c:when test="${BoardList.slctnYycl=='9999' }">
														<div class="noti-endtext">상시모집</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
														<div class="noti-endtext">모집예정</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
														<div class="noti-endtext">D-${labVo.dday}</div>
													</c:when>
													<c:when test="${BoardList.dday == 0 }">
														<div class="noti-endtext">오늘마감</div>
													</c:when>
													<c:when test="${BoardList.dday < 0 }">
														<div class="noti-endtext">모집마감</div>
													</c:when>
												</c:choose>
											</span>
										</div>
									</div>
								</c:if>

								<!-- 연구실 유료 -->
								<c:if
									test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									<div
										class="w3-display-container w3-round-large w3-white w3-card w3-margin-bottom scrapnoti${BoardList.slctnNotiNo }">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">
												<c:choose>
													<c:when test="${BoardList.bk21EorgnzSuprtYn =='Y' }">
														<div class="w3-small"
															style="margin-bottom: -1.5em; height: 2.7em">
															<span class="w3-text-white w3-round-large"
																style="background: linear-gradient(141deg, rgba(255, 0, 0, 1), rgba(0, 0, 255, 1));">&nbsp;BK
																21+&nbsp;</span>
														</div>
													</c:when>
													<c:otherwise>
														<span
															style="padding-right: 2px; padding-left: 10px; margin-right: -5px"></span>
														<span style="padding-right: 5px; padding-left: 0px;"></span>
													</c:otherwise>
												</c:choose>
											</div>
											<div style="margin-bottom: 0em;">
												<img class='anti' src="${BoardList.storgPath }" alt="${BoardList.major }"
													style="width: 100%; padding: 1em 1em 0 1em; height: 83px;">
											</div>
											<div class="w3-container w3-center">
												<h4>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">
													<span class="grad-target">${BoardList.slctnTitle }</span>
												</p>
											</div>

											<div class="research-field w3-padding text-center">
												<c:forEach items="${BoardList.researchList }" var="resList"
													varStatus="status">
													<span class="w3-tag w3-light-grey w3-tiny ">${resList.cdNm }</span>
												</c:forEach>
											</div>
										</div>
										<div
											class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
											<i class="far fa-thumbtack w3-large"
												onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
										</div>
										<div class="w3-row-padding w3-padding">
											<span
												class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
												style="float: right;"> <c:choose>
													<c:when test="${BoardList.slctnYycl=='9999' }">
														<div class="noti-endtext">상시모집</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
														<div class="noti-endtext">모집예정</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
														<div class="noti-endtext">D-${labVo.dday}</div>
													</c:when>
													<c:when test="${BoardList.dday == 0 }">
														<div class="noti-endtext">오늘마감</div>
													</c:when>
													<c:when test="${BoardList.dday < 0 }">
														<div class="noti-endtext">모집마감</div>
													</c:when>
												</c:choose>
											</span>
										</div>
									</div>
								</c:if>

								<!-- 대학원 무료-->
								<c:if
									test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">

										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year }년
												${BoardList.slctnSemstr}</div>
											<div class="w3-container w3-center w3-padding"
												style="margin-bottom: -1em;">
												<h4 class="w3-padding w3-round-large"
													style="margin-bottom: 0em;">
													<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
											</div>
										</div>
										<div class="w3-row-padding w3-padding">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
											<div class="w3-row-padding w3-padding">
												<span
													class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
													style="float: right;"> <c:choose>
														<c:when test="${BoardList.slctnYycl=='9999' }">
															<div class="noti-endtext">상시모집</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
															<div class="noti-endtext">모집예정</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
															<div class="noti-endtext">D-${labVo.dday}</div>
														</c:when>
														<c:when test="${BoardList.dday == 0 }">
															<div class="noti-endtext">오늘마감</div>
														</c:when>
														<c:when test="${BoardList.dday < 0 }">
															<div class="noti-endtext">모집마감</div>
														</c:when>
													</c:choose>
												</span>
											</div>
										</div>
									</div>

								</c:if>


								<!-- 연구실 무료-->

								<c:if
									test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }"
										onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year }년
												${BoardList.slctnSemstr }</div>
											<div class="w3-container w3-center w3-padding"
												style="margin-bottom: -1em;">
												<h5 class="w3-padding" style="margin-bottom: 0em;">
													<strong style="color: ${BoardList.symbolColorNm };">${BoardList.university }
													</strong>
												</h5>
												<h5>
													<strong>${BoardList.graduate } ${BoardList.lab }</strong>
												</h5>
												<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
											</div>
										</div>
										<div class="w3-row-padding w3-padding">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
											<div class="w3-row-padding w3-padding">
												<span
													class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
													style="float: right;"> <c:choose>
														<c:when test="${BoardList.slctnYycl=='9999' }">
															<div class="noti-endtext">상시모집</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
															<div class="noti-endtext">모집예정</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
															<div class="noti-endtext">D-${labVo.dday}</div>
														</c:when>
														<c:when test="${BoardList.dday == 0 }">
															<div class="noti-endtext">오늘마감</div>
														</c:when>
														<c:when test="${BoardList.dday < 0 }">
															<div class="noti-endtext">모집마감</div>
														</c:when>
													</c:choose>
												</span>
											</div>
										</div>
									</div>
								</c:if>

								<!-- 게시글 -->
								<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">

									<c:if test="${BoardList.slctnEndDt == 9999 }">

										<div
											class="w3-card w3-round-large w3-margin-bottom main-banner w3-white counseling"
											value=${BoardList.slctnNotiNo }>
											<div class="w3-padding w3-text-grey w3-small">
												<span class="">${fn:replace(BoardList.bbsNm,'게시판','') }
													- <c:if test="${fn:substring(name,0,2) =='상담'}">
												Question
											</c:if> <c:if test="${fn:substring(name,0,2) !='상담' }">
												Ordinary
											</c:if> - <c:if test="${BoardList.storgPath ne null }">
												with Image                    	
											</c:if> <c:if test="${BoardList.storgPath eq null }">
												no Image
											</c:if>
												</span>
											</div>



											<!-- 이미지가 있는 경우 -->
											<c:if test="${BoardList.storgPath ne null }">
												<div class="w3-display-container">
													<img class='anti' src="${BoardList.storgPath }" alt=""
														style="width: 100%;">

													<!--제목-->
													<div
														class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
														style="background-color: rgba(0, 0, 0, 0.5);">#${BoardList.wrtbtTitle
														}</div>
												</div>
											</c:if>


											<!-- 이미지가 없는 경우 -->
											<c:if test="${BoardList.storgPath eq null }">
												<div class="w3-center w3-container">
													<h5 style="margin-bottom: 0em;">
														<strong>${BoardList.wrtbtTitle }</strong>
													</h5>
												</div>
												<div class="w3-container" style="margin-bottom: -1em;">
													<div class="w3-container w3-margin-top">
														<p class="w3-medium mypage-text"
															style="margin-top: 0em; line-height: 200%; max-height: 10em; text-overflow: ellipsis; overflow: hidden;">
															${BoardList.wrtbtText }</p>
														<span
															class="w3-medium w3-left w3-margin-bottom w3-text-blue read-more"
															style="font-size: 1.8vmin; margin-top: -1.5em;">(read
															more)</span>
													</div>
												</div>
											</c:if>

											<c:if
												test="${BoardList.subSlctnEndDt == 9999 || BoardList.subSlctnEndDt == null }">

												<c:if test="${BoardList.count>0 }">
													<div class="w3-container w3-margin-top">
														<!--코멘트 수-->
														<span class="w3-small w3-padding"> <c:if
																test="${fn:substring(name,0,2) =='상담'}">
													Answer
												</c:if> <c:if test="${fn:substring(name,0,2) !='상담' }">
													Comment
												</c:if> <span class="w3-badge w3-light-gray">${BoardList.count }</span>
														</span>
														<!--코멘트(베스트)-->
														<p
															class="board-answer w3-round-large w3-padding w3-medium"
															style="font-size: 1.8vmin; margin-top: 0em; line-height: 200%; max-height: 4em; text-overflow: ellipsis; overflow: hidden;">
															${BoardList.subwrtbtText }</p>
													</div>
												</c:if>
												<c:if test="${BoardList.count <=0 }">
													<div class="w3-container w3-margin-top"></div>
												</c:if>


											</c:if>


											<c:if
												test="${BoardList.subSlctnEndDt != 9999 && BoardList.subSlctnEndDt != null }">

												<div class='w3-container w3-padding w3-text-light-grey'>
													<h4>
														<b>사용자에 의해 삭제된 게시물입니다.</b>
													</h4>
												</div>

											</c:if>

											<c:if
												test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
												<div class="w3-container w3-center w3-padding">
													<button
														class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply"
														style="letter-spacing: 2px;"
														value="${BoardList.slctnNotiNo}">답변하기</button>
												</div>
											</c:if>
										</div>
									</c:if>




									<c:if test="${BoardList.slctnEndDt != 9999}">

									</c:if>




								</c:if>


								<!-- 게시글 끝 -->

							</c:if>
						</c:forEach>

					</div>


					<!--lane 3-->
					<div class="w3-col s12 m6 l4 w3-row-padding w3-margin-bottom">
						<c:forEach items="${BoardList }" var="BoardList"
							varStatus="status">
							<c:set var="name" value="${BoardList.slctnNotiDstnct}" />
							<c:set var="leng" value="${fn:length(name)}" />
							<c:if
								test="${BoardList.no%3==0 && calList.month==BoardList.month && calList.day==BoardList.day }">


								<!-- 대학원 유료 -->
								<c:if
									test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='Y'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-card w3-margin-bottom scrapnoti${BoardList.slctnNotiNo }">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year}년
												${BoardList.slctnSemstr}</div>
											<div style="margin-bottom: 0em;">
												<img class='anti' src="${BoardList.storgPath }" alt="${BoardList.major }"
													style="width: 100%; padding: 1em 1em 0 1em; height: 83px;">
											</div>
											<div class="w3-container w3-center">
												<h4>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">
													<span class="grad-target">${BoardList.slctnTitle }</span>
												</p>
											</div>
											<div class="w3-container">
												<div class="w3-light-grey w3-tiny">
													<c:if test="${BoardList.percent<=0 }">
														<div class="w3-container" style="width: 0%; height: 1px;"></div>
													</c:if>
													<c:if test="${BoardList.percent>0 }">
														<div class="w3-container w3-black"
															style="width: ${BoardList.percent }%; height: 1px;"></div>
													</c:if>
												</div>
											</div>

										</div>

										<div class="w3-container w3-margin-top">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
										</div>

										<div class="w3-row-padding w3-padding">
											<span
												class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
												style="float: right;"> <c:choose>
													<c:when test="${BoardList.slctnYycl=='9999' }">
														<div class="noti-endtext">상시모집</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
														<div class="noti-endtext">모집예정</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
														<div class="noti-endtext">D-${labVo.dday}</div>
													</c:when>
													<c:when test="${BoardList.dday == 0 }">
														<div class="noti-endtext">오늘마감</div>
													</c:when>
													<c:when test="${BoardList.dday < 0 }">
														<div class="noti-endtext">모집마감</div>
													</c:when>
												</c:choose>
											</span>
										</div>
									</div>
								</c:if>

								<!-- 연구실 유료 -->
								<c:if
									test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='Y'}">
									<div
										class="w3-display-container w3-round-large w3-white w3-card w3-margin-bottom scrapnoti${BoardList.slctnNotiNo }">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">
												<c:choose>
													<c:when test="${BoardList.bk21EorgnzSuprtYn =='Y' }">
														<div class="w3-small"
															style="margin-bottom: -1.5em; height: 2.7em">
															<span class="w3-text-white w3-round-large"
																style="background: linear-gradient(141deg, rgba(255, 0, 0, 1), rgba(0, 0, 255, 1));">&nbsp;BK
																21+&nbsp;</span>
														</div>
													</c:when>
													<c:otherwise>
														<span
															style="padding-right: 2px; padding-left: 10px; margin-right: -5px"></span>
														<span style="padding-right: 5px; padding-left: 0px;"></span>
													</c:otherwise>
												</c:choose>
											</div>
											<div style="margin-bottom: 0em;">
												<img class='anti' src="${BoardList.storgPath }" alt="${BoardList.major }"
													style="width: 100%; padding: 1em 1em 0 1em; height: 83px;">
											</div>
											<div class="w3-container w3-center">
												<h4>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">
													<span class="grad-target">${BoardList.slctnTitle }</span>
												</p>
											</div>

											<div class="research-field w3-padding text-center">
												<c:forEach items="${BoardList.researchList }" var="resList"
													varStatus="status">
													<span class="w3-tag w3-light-grey w3-tiny ">${resList.cdNm }</span>
												</c:forEach>
											</div>
										</div>
										<div
											class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
											<i class="far fa-thumbtack w3-large"
												onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
										</div>
										<div class="w3-row-padding w3-padding">
											<span
												class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
												style="float: right;"> <c:choose>
													<c:when test="${BoardList.slctnYycl=='9999' }">
														<div class="noti-endtext">상시모집</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
														<div class="noti-endtext">모집예정</div>
													</c:when>
													<c:when
														test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
														<div class="noti-endtext">D-${labVo.dday}</div>
													</c:when>
													<c:when test="${BoardList.dday == 0 }">
														<div class="noti-endtext">오늘마감</div>
													</c:when>
													<c:when test="${BoardList.dday < 0 }">
														<div class="noti-endtext">모집마감</div>
													</c:when>
												</c:choose>
											</span>
										</div>
									</div>
								</c:if>

								<!-- 대학원 무료-->
								<c:if
									test="${BoardList.slctnNotiDstnct == '대학원' && BoardList.pchrgYn=='N'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">

										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year }년
												${BoardList.slctnSemstr}</div>
											<div class="w3-container w3-center w3-padding"
												style="margin-bottom: -1em;">
												<h4 class="w3-padding w3-round-large"
													style="margin-bottom: 0em;">
													<strong style="color: ${BoardList.symbolColorNm };">${BoardList.major }</strong>
													<strong>${BoardList.lab }</strong>
												</h4>
												<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
											</div>
										</div>
										<div class="w3-row-padding w3-padding">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
											<div class="w3-row-padding w3-padding">
												<span
													class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
													style="float: right;"> <c:choose>
														<c:when test="${BoardList.slctnYycl=='9999' }">
															<div class="noti-endtext">상시모집</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
															<div class="noti-endtext">모집예정</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
															<div class="noti-endtext">D-${labVo.dday}</div>
														</c:when>
														<c:when test="${BoardList.dday == 0 }">
															<div class="noti-endtext">오늘마감</div>
														</c:when>
														<c:when test="${BoardList.dday < 0 }">
															<div class="noti-endtext">모집마감</div>
														</c:when>
													</c:choose>
												</span>
											</div>
										</div>
									</div>

								</c:if>


								<!-- 연구실 무료-->

								<c:if
									test="${BoardList.slctnNotiDstnct == '연구실' && BoardList.pchrgYn=='N'}">

									<div
										class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }"
										onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
										<div
											onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
											<div class="w3-padding w3-text-grey w3-small"
												style="margin-bottom: -1.5em;">${BoardList.year }년
												${BoardList.slctnSemstr }</div>
											<div class="w3-container w3-center w3-padding"
												style="margin-bottom: -1em;">
												<h5 class="w3-padding" style="margin-bottom: 0em;">
													<strong style="color: ${BoardList.symbolColorNm };">${BoardList.university }
													</strong>
												</h5>
												<h5>
													<strong>${BoardList.graduate } ${BoardList.lab }</strong>
												</h5>
												<p style="font-size: 1.8vmin;">${BoardList.slctnTitle }</p>
											</div>
										</div>
										<div class="w3-row-padding w3-padding">
											<div
												class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
												<i class="far fa-thumbtack w3-large"
													onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
											</div>
											<div class="w3-row-padding w3-padding">
												<span
													class="w3-right w3-tag w3-round-large w3-light-grey w3-text-blue"
													style="float: right;"> <c:choose>
														<c:when test="${BoardList.slctnYycl=='9999' }">
															<div class="noti-endtext">상시모집</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday > BoardList.totaldays}">
															<div class="noti-endtext">모집예정</div>
														</c:when>
														<c:when
															test="${BoardList.dday > 0 && BoardList.dday <= BoardList.totaldays}">
															<div class="noti-endtext">D-${labVo.dday}</div>
														</c:when>
														<c:when test="${BoardList.dday == 0 }">
															<div class="noti-endtext">오늘마감</div>
														</c:when>
														<c:when test="${BoardList.dday < 0 }">
															<div class="noti-endtext">모집마감</div>
														</c:when>
													</c:choose>
												</span>
											</div>
										</div>
									</div>
								</c:if>

								<!-- 게시글 -->
								<c:if test="${'게시판' == fn:substring(name,leng-3,leng)}">

									<c:if test="${BoardList.slctnEndDt == 9999 }">

										<div
											class="w3-card w3-round-large w3-margin-bottom main-banner w3-white counseling"
											value=${BoardList.slctnNotiNo }>
											<div class="w3-padding w3-text-grey w3-small">
												<span class="">${fn:replace(BoardList.bbsNm,'게시판','') }
													- <c:if test="${fn:substring(name,0,2) =='상담'}">
												Question
											</c:if> <c:if test="${fn:substring(name,0,2) !='상담' }">
												Ordinary
											</c:if> - <c:if test="${BoardList.storgPath ne null }">
												with Image                    	
											</c:if> <c:if test="${BoardList.storgPath eq null }">
												no Image
											</c:if>
												</span>
											</div>



											<!-- 이미지가 있는 경우 -->
											<c:if test="${BoardList.storgPath ne null }">
												<div class="w3-display-container">
													<img class='anti' src="${BoardList.storgPath }" alt=""
														style="width: 100%;">

													<!--제목-->
													<div
														class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
														style="background-color: rgba(0, 0, 0, 0.5);">#${BoardList.wrtbtTitle
														}</div>
												</div>
											</c:if>


											<!-- 이미지가 없는 경우 -->
											<c:if test="${BoardList.storgPath eq null }">
												<div class="w3-center w3-container">
													<h5 style="margin-bottom: 0em;">
														<strong>${BoardList.wrtbtTitle }</strong>
													</h5>
												</div>
												<div class="w3-container" style="margin-bottom: -1em;">
													<div class="w3-container w3-margin-top">
														<p class="w3-medium mypage-text"
															style="margin-top: 0em; line-height: 200%; max-height: 10em; text-overflow: ellipsis; overflow: hidden;">
															${BoardList.wrtbtText }</p>
														<span
															class="w3-medium w3-left w3-margin-bottom w3-text-blue read-more"
															style="font-size: 1.8vmin; margin-top: -1.5em;">(read
															more)</span>
													</div>
												</div>
											</c:if>

											<c:if
												test="${BoardList.subSlctnEndDt == 9999 || BoardList.subSlctnEndDt == null }">

												<c:if test="${BoardList.count>0 }">
													<div class="w3-container w3-margin-top">
														<!--코멘트 수-->
														<span class="w3-small w3-padding"> <c:if
																test="${fn:substring(name,0,2) =='상담'}">
													Answer
												</c:if> <c:if test="${fn:substring(name,0,2) !='상담' }">
													Comment
												</c:if> <span class="w3-badge w3-light-gray">${BoardList.count }</span>
														</span>
														<!--코멘트(베스트)-->
														<p
															class="board-answer w3-round-large w3-padding w3-medium"
															style="font-size: 1.8vmin; margin-top: 0em; line-height: 200%; max-height: 4em; text-overflow: ellipsis; overflow: hidden;">
															${BoardList.subwrtbtText }</p>
													</div>
												</c:if>
												<c:if test="${BoardList.count <=0 }">
													<div class="w3-container w3-margin-top"></div>
												</c:if>


											</c:if>


											<c:if
												test="${BoardList.subSlctnEndDt != 9999 && BoardList.subSlctnEndDt != null }">

												<div class='w3-container w3-padding w3-text-light-grey'>
													<h4>
														<b>사용자에 의해 삭제된 게시물입니다.</b>
													</h4>
												</div>

											</c:if>

											<c:if
												test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
												<div class="w3-container w3-center w3-padding">
													<button
														class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply"
														style="letter-spacing: 2px;"
														value="${BoardList.slctnNotiNo}">답변하기</button>
												</div>
											</c:if>
										</div>
									</c:if>




									<c:if test="${BoardList.slctnEndDt != 9999}">

									</c:if>




								</c:if>

								<!-- 게시글 끝 -->

							</c:if>
						</c:forEach>

					</div>

					<!-- 끝 -->

				</div>
			</div>
		</c:forEach>
	</c:if>

	<!-- 모집공고, 새소식 끝 -->


	<!-- 스크랩 시작 -->

	<c:if test="${type == 'myscrap'}">
		<div class="w3-row w3-margin-bottom">

			<div class="w3-panel w3-border-bottom w3-border-black">
				<h3>
					<div style="float: left; margin-right: 0.3em;">대학원/연구실 스크랩</div>

				</h3>
			</div>
		</div>

		<!-- 스크랩 대학원/연구실 모집공고 -->

		<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
			<c:set var="name" value="${BoardList.slctnNotiDstnct}" />
			<c:set var="leng" value="${fn:length(name)}" />
			<c:if
				test="${BoardList.slctnNotiDstnct=='연구실' || BoardList.slctnNotiDstnct=='대학원'}">


				<c:if test="${BoardList.slctnNotiDstnct=='연구실' }">
					<div
						class="w3-row w3-border-top w3-round-large w3-margin-bottom w3-content w3-white lab-banner"
						style="max-width: 1000px;" id="scrapnoti${BoardList.slctnNotiNo }">
				</c:if>

				<c:if test="${BoardList.slctnNotiDstnct=='대학원' }">
					<div
						class="w3-row w3-border-top w3-round-large w3-margin-bottom w3-content w3-white grad-banner"
						style="max-width: 1000px;" id="scrapnoti${BoardList.slctnNotiNo }">
				</c:if>






				<!--대학원-->
				<div class="w3-col s12 m12 l12 w3-bar w3-padding">
					<button class="w3-padding w3-white w3-button"
						style="font-size: 2.2vmin;"
						onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=${BoardList.slctnNotiDstnct}'">
						<i class="far fa-university fa-lg"></i><b>${BoardList.major }${BoardList.lab }</b>
						${BoardList.slctnTitle }
					</button>
					<button
						onclick="deleteScrap('모집공고',${BoardList.slctnNotiNo},${authUser.mbNo });"
						class="w3-button w3-right">&times;</button>

				</div>

				<!-- 연구실 정보 -->
				<c:if test="${BoardList.slctnNotiDstnct=='연구실'}">
					<div class="w3-center">
						<div class="w3-col s6 m6 l6 w3-border-top">
							<div class=" w3-padding">
								<span class="w3-padding w3-text-grey" style="font-size: 2vmin;">지도교수</span>
								<br> <span style="font-size: 2vmin;">${BoardList.mapProfNm }</span>
							</div>
						</div>
						<div class="w3-col s6 m6 l6 w3-border-top">
							<div class=" w3-padding">
								<span class="w3-padding w3-text-grey" style="font-size: 2vmin;">모집전공</span>
								<br> <span style="font-size: 2vmin;"> <c:if
										test="${BoardList.researchList == null }">
													무관
												</c:if> <c:forEach items="${BoardList.researchList }" var="resList"
										varStatus="status">
										<c:choose>
											<c:when test="${status.last}">
															${resList.cdNm }	
														</c:when>
											<c:otherwise>
															${resList.cdNm },
														</c:otherwise>
										</c:choose>
									</c:forEach>

								</span>
							</div>
						</div>
					</div>
				</c:if>

				<div class="w3-center">
					<div class="w3-col s6 m3 l3  w3-border-top w3-white w3-padding">
						<span class="w3-padding w3-text-grey" style="font-size: 2vmin;">모집기간</span>
						<br> <span style="font-size: 2vmin;"> <c:if
								test="${BoardList.slctnSemstr=='상시' }">상시모집</c:if> <c:if
								test="${BoardList.slctnSemstr!='상시' }">${BoardList.slctnBeginDt }~${BoardList.slctnEndDt }</c:if>
						</span>
					</div>
					<div class="w3-col s6 m3 l3  w3-border-top w3-white w3-padding">
						<span class="w3-padding w3-text-grey" style="font-size: 2vmin;">지역</span>
						<br> <span style="font-size: 2vmin;">${BoardList.ar }</span>
					</div>
					<div class="w3-col s6 m3 l3  w3-border-top w3-white w3-padding">
						<span class="w3-padding w3-text-grey" style="font-size: 2vmin;">전형방법</span>
						<br> <span style="font-size: 2vmin;">${BoardList.slsnMth }</span>
					</div>

					<div class="w3-col s6 m3 l3  w3-border-top w3-white w3-padding">
						<span class="w3-padding w3-text-grey" style="font-size: 2vmin;">모집인원</span>
						<br> <span style="font-size: 2vmin;">${BoardList.slctnNops }</span>
					</div>
				</div>


				<!-- 연구실 지원내역 -->
				<c:if test="${BoardList.slctnNotiDstnct=='연구실'}">
					<div class="w3-col s12 m12 l12 w3-white  w3-border-top">
						<div class=" w3-padding">
							<span class="w3-padding w3-text-grey" style="font-size: 2vmin;">지원내역</span>
							<div class="w3-container">
								<c:if test="${BoardList.tuitionSuprtYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">등록금
										지원</span>
								</c:if>
								<c:if test="${BoardList.lvncSuprtYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">생활비
										지원</span>
								</c:if>
								<c:if test="${BoardList.bk21EorgnzSuprtYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">BK
										지원</span>
								</c:if>
								<c:if test="${BoardList.incetSuprtYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">인센티브
										지원</span>
								</c:if>
								<c:if test="${BoardList.lrstyJoingfeeSuprtYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">학회
										참가비 지원</span>
								</c:if>
								<c:if test="${BoardList.dormSuprtYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">기숙사
										지원</span>
								</c:if>
								<c:if test="${BoardList.internYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">인턴
										지원</span>
								</c:if>
								<c:if test="${BoardList.lrstyJoingYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">학회
										참가 지원</span>
								</c:if>
								<c:if test="${BoardList.resrchTaskJoingYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">연구
										과제 참가 지원</span>
								</c:if>
								<c:if test="${BoardList.stdtrOpptySuprtYn == 'Y' }">
													<<span class="w3-padding  " style="font-size: 2vmin;">연수
										기회 지원</span>
								</c:if>
								<c:if test="${BoardList.eduPgmJoingSuprtYn == 'Y' }">
									<span class="w3-padding  " style="font-size: 2vmin;">교육프로그램
										지원</span>
								</c:if>
							</div>
						</div>
					</div>

				</c:if>


				<div class="w3-col s12 m12 l12 w3-border-top">
					<div class="w3-center w3-padding">
						<button onclick="myFunction(${BoardList.slctnNotiNo })"
							class="w3-large w3-white w3-button">
							<b>Contact</b>
						</button>
						<div id="${BoardList.slctnNotiNo }"
							class="w3-hide w3-animate-opacity w3-content">
							<span class=" w3-block w3-left-align"><i
								class="far fa-user"></i> ${BoardList.chrgrNm }</span> <span
								class=" w3-block w3-left-align"><i class="far fa-phone"></i>
								${BoardList.chrgrTelNo } </span> <span class="w3-block w3-left-align"><i
								class="far fa-envelope"></i> ${BoardList.chrgrEmail }</span>
						</div>
					</div>
				</div>
				</div>

			</c:if>
		</c:forEach>


		<div class="w3-row w3-margin-bottom">
			<div class="w3-panel w3-border-bottom w3-border-black">
				<h3>
					<div style="float: left; margin-right: 0.3em;">교육/모임 스크랩</div>
				</h3>
			</div>
		</div>

		<div class="w3-margin-bottom w3-content" style="max-width: 1000px;">
			<!--교육모임-->
			<div class="w3-row">
				<div class="w3-panel w3-border-bottom w3-border-black">
					<h3>
						<div
							style="float: left; margin-right: 0.3em; letter-spacing: 3px;">
							<strong>교육</strong>
						</div>
					</h3>
				</div>
				<div class="w3-row-padding">
					<!--lane 1-->
					<div class="w3-col s12 m6 l3">
						<div
							class="w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							<div class="w3-padding w3-text-grey w3-small">
								<span class="">Category - Meeting -with Image</span> <span
									class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
							</div>
							<div class="w3-display-container">
								<img class='anti' class="meeting-title"
									src="https://onoffmix.com/images/event/81439/s"
									style="width: 100%;">
								<div
									class="w3-large w3-display-topleft w3-padding w3-text-white w3-round-large"
									style="background-color: rgba(0, 0, 0, 0.6);">서울</div>
							</div>
							<div class="w3-container w3-margin-top ">
								<a class="bar-deco" href="meeting.html">
									<button
										class="w3-button w3-block w3-border w3-white w3-round-large w3-margin-bottom w3-large"
										style="letter-spacing: 2px;">Request</button>
								</a>
							</div>
						</div>
					</div>

					<!--lane 2-->
					<div class="w3-col s12 m6 l3">
						<div
							class="w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							<div class="w3-padding w3-text-grey w3-small">
								<span class="">Category - Meeting -with Image</span> <span
									class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
							</div>
							<div class="w3-display-container">
								<img class='anti' class="meeting-title"
									src="https://onoffmix.com/images/event/82819/s"
									style="width: 100%;">
								<div
									class="w3-large w3-display-topleft w3-padding w3-text-white w3-round-large"
									style="background-color: rgba(0, 0, 0, 0.6);">서울</div>
							</div>
							<div class="w3-container w3-margin-top ">
								<a class="bar-deco" href="meeting.html">
									<button
										class="w3-button w3-block w3-border w3-white w3-round-large w3-margin-bottom w3-large"
										style="letter-spacing: 2px;">Request</button>
								</a>
							</div>
						</div>
					</div>

					<!--lane 3-->
					<div class="w3-col s12 m6 l3">
						<div
							class="w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							<div class="w3-padding w3-text-grey w3-small">
								<span class="">Category - Meeting -with Image</span> <span
									class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
							</div>
							<div class="w3-display-container">
								<img class='anti' class="meeting-title"
									src="https://onoffmix.com/images/event/79536/s"
									style="width: 100%;">
								<div
									class="w3-large w3-display-topleft w3-padding w3-text-white w3-round-large"
									style="background-color: rgba(0, 0, 0, 0.6);">서울</div>
							</div>
							<div class="w3-container w3-margin-top ">
								<a class="bar-deco" href="meeting.html">
									<button
										class="w3-button w3-block w3-border w3-white w3-round-large w3-margin-bottom w3-large"
										style="letter-spacing: 2px;">Request</button>
								</a>
							</div>
						</div>
					</div>

					<div class="w3-col s12 m6 l3">
						<div
							class="w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							<div class="w3-padding w3-text-grey w3-small">
								<span class="">Category - Meeting -with Image</span> <span
									class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
							</div>
							<div class="w3-display-container">
								<img class='anti' class="meeting-title"
									src="https://onoffmix.com/images/event/97153/s"
									style="width: 100%;">
								<div
									class="w3-large w3-display-topleft w3-padding w3-text-white w3-round-large"
									style="background-color: rgba(0, 0, 0, 0.6);">서울</div>
							</div>
							<div class="w3-container w3-margin-top ">
								<a class="bar-deco" href="meeting.html">
									<button
										class="w3-button w3-block w3-border w3-white w3-round-large w3-margin-bottom w3-large"
										style="letter-spacing: 2px;">Request</button>
								</a>
							</div>
						</div>
					</div>

					<div class="w3-col s12 m6 l3">
						<div
							class="w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							<div class="w3-padding w3-text-grey w3-small">
								<span class="">Category - Meeting -with Image</span> <span
									class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
							</div>
							<div class="w3-display-container">
								<img class='anti' class="meeting-title"
									src="https://onoffmix.com/images/event/79131/s"
									style="width: 100%;">
								<div
									class="w3-large w3-display-topleft w3-padding w3-text-white w3-round-large"
									style="background-color: rgba(0, 0, 0, 0.6);">서울</div>
							</div>
							<div class="w3-container w3-margin-top ">
								<a class="bar-deco" href="meeting.html">
									<button
										class="w3-button w3-block w3-border w3-white w3-round-large w3-margin-bottom w3-large"
										style="letter-spacing: 2px;">Request</button>
								</a>
							</div>
						</div>
					</div>

					<div class="w3-col s12 m6 l3">
						<div
							class="w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							<div class="w3-padding w3-text-grey w3-small">
								<span class="">Category - Meeting -with Image</span> <span
									class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
							</div>
							<div class="w3-display-container">
								<img class='anti' class="meeting-title"
									src="https://onoffmix.com/images/event/17004/s"
									style="width: 100%;">
								<div
									class="w3-large w3-display-topleft w3-padding w3-text-white w3-round-large"
									style="background-color: rgba(0, 0, 0, 0.6);">서울</div>
							</div>
							<div class="w3-container w3-margin-top ">
								<a class="bar-deco" href="meeting.html">
									<button
										class="w3-button w3-block w3-border w3-white w3-round-large w3-margin-bottom w3-large"
										style="letter-spacing: 2px;">Request</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="w3-row w3-margin-bottom">
			<div class="w3-panel w3-border-bottom w3-border-black">
				<h3>
					<div style="float: left; margin-right: 0.3em;">게시글 스크랩</div>
				</h3>
			</div>
		</div>


		<div
			class="w3-card w3-white w3-round-large w3-margin-bottom w3-content"
			style="max-width: 800px;">
			<!--게시글-->
			<div class="w3-col s12 m12 l12 w3-margin-bottom ">


				<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
					<c:set var="name" value="${BoardList.slctnNotiDstnct}" />
					<c:set var="leng" value="${fn:length(name)}" />
					<c:if test="${fn:substring(name,leng-3,leng)=='게시판'}">



						<c:if test="${BoardList.slctnEndDt == 9999 }">
							<div
								class="w3-card w3-round-large w3-margin-bottom w3-white talk-banner"
								id="scrapcoun${BoardList.slctnNotiNo }">

								<div class="w3-padding w3-text-grey w3-small">
									<span class=""> <c:if
											test="${BoardList.wrtbtDstnct=='상담게시판' }">
											Question Asked
										</c:if> <c:if test="${BoardList.wrtbtDstnct=='일반게시판' }">
											Ordinary
										</c:if> - ${fn:replace(BoardList.bbsNm,'게시판','') }
									</span> <span class="w3-right"><button
											onclick="deleteScrap('게시글',${BoardList.slctnNotiNo},${authUser.mbNo });"
											class="w3-button w3-right">&times;</button></span>
								</div>

								<div class="counseling" value="${BoardList.slctnNotiNo }">



									<!-- 이미지가 있는 경우 -->
									<c:if test="${BoardList.storgPath ne null }">
										<div class="w3-margin-left">
											<h5 style="margin-bottom: 0em;">

												<c:if test="${BoardList.wrtbtDstnct=='상담게시판' }">
													<i class="far fa-question fa-lg"></i>
												</c:if>
												<c:if test="${BoardList.wrtbtDstnct=='일반게시판' }">
													<i class="far fa-sun fa-lg"></i>
												</c:if>
												<strong>${BoardList.wrtbtTitle }</strong>
											</h5>
										</div>
										<div class="w3-display-container">
											<img class='anti' src="${BoardList.storgPath }" alt=""
												style="width: 100%;">

											<!--제목-->
											<div
												class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
												style="background-color: rgba(0, 0, 0, 0.5);">#${BoardList.wrtbtTitle
												}</div>
										</div>
									</c:if>


									<!-- 이미지가 없는 경우 -->
									<c:if test="${BoardList.storgPath eq null }">
										<div class="w3-center w3-container">
											<h5 style="margin-bottom: 0em;">
												<strong>${BoardList.wrtbtTitle }</strong>
											</h5>
										</div>
										<div class="w3-container" style="margin-bottom: -1em;">
											<div class="w3-container w3-margin-top">

												<p class="w3-medium mypage-text"
													style="margin-top: 0em; line-height: 200%; max-height: 10em; text-overflow: ellipsis; overflow: hidden;">
													${BoardList.wrtbtText }</p>
												<span
													class="w3-medium w3-left w3-margin-bottom w3-text-blue read-more"
													style="font-size: 1.8vmin; margin-top: -1.5em;">(read
													more)</span>
											</div>
										</div>
									</c:if>


									<c:if
										test="${BoardList.subSlctnEndDt == 9999 || BoardList.subSlctnEndDt == null }">
										<c:if test="${BoardList.count>0 }">
											<div class="w3-container w3-margin-top">
												<!--코멘트 수-->
												<span class="w3-small w3-padding"> <c:if
														test="${fn:substring(name,0,2) =='상담'}">
													Answer
												</c:if> <c:if test="${fn:substring(name,0,2) !='상담' }">
													Comment
												</c:if> <span class="w3-badge w3-light-gray">${BoardList.count }</span>
												</span>
												<!--코멘트(베스트)-->
												<p class="board-answer w3-round-large w3-padding w3-medium"
													style="font-size: 1.8vmin; margin-top: 0em; line-height: 200%; max-height: 4em; text-overflow: ellipsis; overflow: hidden;">
													${BoardList.subwrtbtText }</p>
											</div>
										</c:if>


										<c:if test="${BoardList.count <=0 }">
											<div class="w3-container w3-margin-top"></div>
										</c:if>
									</c:if>

									<c:if
										test="${BoardList.subSlctnEndDt != 9999 && BoardList.subSlctnEndDt != null }">

										<div class='w3-container w3-padding w3-text-light-grey'>
											<h4>
												<b>사용자에 의해 삭제된 게시물입니다.</b>
											</h4>
										</div>

									</c:if>





									<c:if
										test="${fn:substring(name,0,2) =='상담' && BoardList.count<=0 }">
										<div class="w3-container w3-center w3-padding">
											<button
												class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply"
												style="letter-spacing: 2px;"
												value="${BoardList.slctnNotiNo}">답변하기</button>
										</div>
									</c:if>
								</div>
							</div>



						</c:if>


						<c:if
							test="${BoardList.slctnEndDt != 9999 && BoardList.slctnEndDt != null}">
							<div
								class="w3-card w3-round-large w3-margin-bottom w3-white talk-banner">
								<div class='w3-container w3-padding w3-text-light-grey'>
									<div class='w3-container w3-padding w3-text-light-grey'>
										<h4>
											<b>사용자에 의해 삭제된 게시물입니다.</b>
										</h4>
									</div>
								</div>
							</div>
						</c:if>








					</c:if>
				</c:forEach>


			</div>
		</div>

	</c:if>

	<!-- 스크랩 끝 -->
	</div>
	</div>



	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/doscrap.js"></script>
</body>
</html>