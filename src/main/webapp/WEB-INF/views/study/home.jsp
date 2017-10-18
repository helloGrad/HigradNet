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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/antimoderate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/antimoder.js"></script>



<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.min.css">


<style>
    

body {
	padding-top: 5em;
}

.qna-banner {
	box-shadow: 5px 10px 10px rgba(0, 0, 51, 0.3), -1px -1px 10px rgba(0, 0, 51, 0.3);
	margin-bottom: 1.5em;
	background-color: white;
}
.qna-banner:hover {
	box-shadow: 5px 10px 30px rgba(0, 0, 51, 0.5), -1px -1px 30px rgba(0, 0, 51, 0.5);
	margin-bottom: 1.5em;
}
.content-answers {
	height: 3.5em;
	text-overflow:ellipsis;
	overflow: hidden;
	white-space: normal;
}
.grad-banner-our {
	box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.15), -1px -1px 10px rgba(0, 0, 0, 0.15);
	margin-bottom: 1.5em;
	background-color: white;
}
.scrap-on {
	color: #FF0000;
}


.grad-banner {
            box-shadow: 3px 3px 10px rgba(179, 0, 0, 0.3), -1px -1px 10px rgba(255, 153, 153, 0.3);
            margin-bottom: 1.5em;
        }
        .lab-banner {
            box-shadow: 3px 3px 10px rgba(0, 0, 255, 0.3), -1px -1px 10px rgba(217, 179, 255, 0.3);
            margin-bottom: 1.5em;
        }
        .conf-banner {
            box-shadow: 3px 3px 10px rgba(0, 128, 0, 0.3), -1px -1px 10px rgba(179, 230, 179, 0.3);
            margin-bottom: 1.5em;
        } 
        .short-cut{
            text-decoration: none;
            color:gray;
        }
        .short-cut:hover{
            color:indianred;
        }
</style>

<script type="text/javascript">


$(function() {
	
	

	
	var authUser = $("#authUser").val();
	
	var click_id;
	
	
	if(authUser == null || authUser == "" ){
		
		
	}else{
		
		
		var scrapList=JSON.parse('${scrapList}');
		for(var i=0;i<scrapList.length;i++){

			if(scrapList[i].prntsDstnct==='게시글'){ 
				
				

				$('.do-scrapcoun' + scrapList[i].prntsNo).addClass('w3-text-red');
				$('.scrapcoun' + scrapList[i].prntsNo).removeClass('w3-card');
				$('.scrapcoun' + scrapList[i].prntsNo).addClass('grad-banner');
				
				
				
			}
			else if(scrapList[i].prntsDstnct==='모집공고'){
				
				$('.do-scrapnoti' + scrapList[i].prntsNo).addClass('w3-text-red');
				$('.scrapnoti' + scrapList[i].prntsNo).removeClass('w3-card');
				$('.scrapnoti' + scrapList[i].prntsNo).addClass('grad-banner');
			}
		};	
		
	}
	

	
	
	
	$(document).on('click', ".counseling", function(event) { 
		
		
		click_id = $(this).attr('value');

		location.href="/net/counseling/detail?no="+click_id+"&type=prnts";
		
		/*
		if (authUser === null || authUser === '') {
			
			//$("#loginForm").css({
				//"display" : "block"
			//});

		}else{
			
			location.href="/net/counseling/detail?no="+click_id+"&type=prnts";
			
		}      
		*/
	
	});
	
	
	
	$(document).on('click', ".counselingreply", function() { 
		
		
		click_id = $(this).attr('value');

		
		if (authUser === null || authUser === '') {
			
			
			location.href="/net/counseling/detail?no="+click_id+"&type=prnts";
			//$("#loginForm").css({
				//"display" : "block"
			//});

		}else{
			
			
			location.href="/net/counseling/detail?no="+click_id+"&type=reply";
			 event.stoplmmediatePropagation();
		}      
	
	
	});
	
	var Boardsize =  $("#Boardsize").val();
	
	
	for(var i=0; i<Boardsize; i++){
		
		
		
		if($('.coheightcheck'+i).height() != 150){
			
			
			$('.readmore'+i).text("");
		}		
		
		
	}

	
	
	
	


});


</script>


</head>
<body>


	<c:import url="/WEB-INF/views/include/header.jsp" />
	<c:import url="/WEB-INF/views/include/subHeader.jsp" />


	<div class="w3-row">
		<div class="container">
		
		<input type="hidden" id="authUser" name="authUser" value="${authUser.mbNo }">
		
			<c:forEach items="${calList }" var="calList" varStatus="status">
			
				<div class="w3-col s12 m12 l12 ">
				
				<h1>
					<div style="float: left; margin-right: 0.3em;">${calList.day }</div>
					<small>
						<div style="float: left; font-size: medium; line-height: 130%;">
							${calList.week }<br>${calList.year }년 ${calList.month }월
						</div>
					</small> <br>
				</h1>
				
				<hr>
				</div>
			
			
			<div class="w3-row">
		
			<div class="">
			<div class="w3-col s12 m12 l4 w3-row-padding w3-margin-bottom">
				
				
			
					
				<input type="hidden" id="Boardsize" name="Boardsize" value="${fn:length(BoardList)}">	
				 
				<c:forEach items="${BoardList }" var="BoardList" varStatus="status"> 
            	
                	
                		
                		
                    <c:if test="${BoardList.orderNum%3 ==0 }"	>
		  		

		  				  <c:choose>
 
							<c:when test="${calList.year ==BoardList.year && calList.month ==BoardList.month && calList.day == BoardList.day }">
					
					 	 			
			                <c:choose>
			 
								 <c:when test="${BoardList.slctnNotiDstnct == '연구실'}">
								  		
								  <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  
								  
								  
						                <div class="w3-display-container w3-round-large w3-white w3-margin-bottom  w3-card scrapnoti${BoardList.slctnNotiNo }">
						              		 <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
							                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">
							                    	<c:choose>
													<c:when test="${BoardList.bk21EorgnzSuprtYn =='Y' }">
														<div class="w3-small"style="margin-bottom: -1.5em; height: 2.7em">
										                    <span class="w3-text-white w3-round-large" style="background: linear-gradient(141deg,rgba(255, 0, 0, 1), rgba(0, 0, 255, 1));">&nbsp;BK 21+&nbsp;</span>
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
							                        <img class='anti' class='anti' src="${BoardList.storgPath }" alt="대학교 로고"
							                             style="width:100%; padding: 1em 1em 0 1em; height:83px;">
							                       
							                    </div>
							                    <div class="w3-container w3-center">
							                        <h4><strong>${BoardList.major}</strong></h4>
							                        <h4 style="height: 2em;"><strong>${BoardList.lab }</strong></h4>
							                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
							                    </div>
						                    
						                  	<div class="research-field w3-padding text-center">
												 <c:forEach items="${majorList}" var="majorList" varStatus="status">
							                        	<c:if test="${BoardList.slctnNotiNo == majorList2.slctnNotiNo }"	>
							                    		  <span class="w3-tag w3-light-grey w3-tiny  ">${majorList2.cdNm}</span>
							                    		</c:if>
							                        </c:forEach>
											</div>
						                    </div>
						                    <div class="w3-row-padding w3-padding">
												 	<div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                        </div>
							                        
													 <c:if test="${BoardList.slctnSemstr == '상시' }"	>
						                              <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">D-${BoardList.dday}</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">모집예정</span>
							                  			 	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">오늘마감</span>
							                  			 
							                    	</c:if>
											</div>
						                  
						                </div>
						         
								  

								

					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								   
							             
							               <div class="w3-display-container grad-banner-our w3-round-large w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
								                   <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								                   	<c:if test="${BoardList.slctnSemstr == '상시' }"	>
							                    		  
							                    		  <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                    	<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                  			 	
							                    	</c:if>
								                   
								                   
								                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								                        <h5 class="w3-padding" style="margin-bottom: 1em; height: 2em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.university} </strong><strong>${BoardList.graduate} ${BoardList.major} ${BoardList.lab}</strong></h5>
								                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
								                    </div>
								                    
								                    </div>
								                    
								                    <div class="w3-row-padding w3-padding">
								                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                        	</div>
								                        
								                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
								                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
							                    		
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
								                  				  	
								                    	</c:if>
								                    	<c:if test="${BoardList.percent < 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
								                  			   	
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘 마감</span>
								                  				
								                    	</c:if>								                       
								                    </div>
								                </div>								                
							          
									  
					                                     
					                </c:if>

							    </c:when>
			 					
							   
								 <c:when test="${BoardList.slctnNotiDstnct == '대학원'}">
								 
								 
								   <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  				
								  	  		    
								  	  		      
								                		<div class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
								              		 <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
									                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
									                    <div style="margin-bottom: 0em;">
									                        <img class='anti'  class='anti' src="${BoardList.storgPath }" alt="대학교 로고"
									                             style="width:100%; padding: 1em 1em 0 1em; height:83px;">
									                       
									                    </div>
									                    <div class="w3-container w3-center">
									                        <h4 style="height: 2em;"><strong>${BoardList.lab}</strong></h4>
									                        <p style="height: 2em; font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
									                    </div>
								                    
								                    <div class="w3-container">
								                    	<div class="w3-light-grey w3-tiny">
															 <c:if test="${BoardList.slctnSemstr == '상시' || BoardList.percent <0 }"	>
												                   <div class="w3-container " style="width: 0; height: 1px;"></div>
												             </c:if>
												             <c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
												             		<div class="w3-container w3-black" style="width: ${BoardList.percent}%; height: 1px;"></div>
												             </c:if>	
														</div>
								                    </div>
								                    </div>
								                    <div class="w3-row-padding w3-padding">
														 	<div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
									                            <i class="far fa-thumbtack w3-large" 
									                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
									                        </div>
															<span
																class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
																style="float: right;">
																          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
															                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">상시 모집</span>
														                    		
														                    	</c:if>
														                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
														                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">D-${BoardList.dday}</span>
														                  			
														                    	</c:if>
														                    	<c:if test="${BoardList.percent < 0 }"	>
														                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">모집예정</span>
														                  			  	
														                    	</c:if>
														                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
														                  			  <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">오늘마감</span>
														                    	</c:if>
															</span>
													</div>
								                  
								                </div>
								      
													  	  		    
								  	  		
	
					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								      <div class="w3-display-container grad-banner-our w3-round-large w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
					                    
					                    <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
					                      <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                      <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							               </c:if>
							               <c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                    	
							               </c:if>
					                    
					                   
					                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
					                        <h4 class="w3-padding w3-round-large" style="margin-bottom: 1em; height: 2em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.major}</strong><strong> ${BoardList.lab}</strong></h4>
					                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
					                    </div>
					                    
					                    
					                    </div>
					                    <div class="w3-row-padding w3-padding">
					                         <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                     <i class="far fa-thumbtack w3-large" 
							                     onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                 </div>
					                        
					                          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                                	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">D-${BoardList.dday}</span>
							                  			
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">모집예정</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">오늘 마감</span>
							                  			  	
							                    	</c:if>

					                    </div>
					                 </div>
								   
           
					                </c:if>

							              
							    </c:when>

							 
							    <c:otherwise>
							    
							      <c:if test="${BoardList.wrtbtDstnct =='일반게시판' }"	>
							      
							     
							      	   <div class="w3-display-container w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							      	   
							      	    <c:if test="${BoardList.avlblEndDt == 9999 }"	>
							      	   	<div class="noti-card counseling" value="${BoardList.slctnNotiNo}">
					                        <div class="w3-padding w3-text-grey w3-small">
					                            <span class="">Category - Ordinary</span>
					                            <span class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
					                        </div>
					                        <div class="w3-display-container">
					                        	  <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		   <div class="w3-center w3-container">
							                            <h5 style="margin-bottom: 0em;"><strong>${BoardList.wrtbtTitle }</strong></h5>
							                        	</div>
							                        	  <div class="w3-container" style="margin-bottom: -1em;">
								                            <div class="w3-container w3-margin-top">
								                                <p class="w3-medium coheightcheck${status.index}" 
								                                   style="margin-top: 0em; line-height: 200%; max-height: 10em;  text-overflow:ellipsis;overflow: hidden;">
								                                   ${BoardList.wrtbtText } </p>
								                                   
								                                   
								                                <span class="w3-medium w3-left w3-margin-bottom w3-text-blue readmore${status.index}"
								                                      style="font-size: 1.8vmin; margin-top: -1.5em;">(read more)</span>
								                                      
								                                      
								                            </div>
								                        </div>
										            </c:if>
										            <c:if test="${BoardList.coSrorgPath  != null }"	>
										                 <img class='anti'  class='anti' src="${BoardList.coSrorgPath }" alt="이미지" style="width:100%">
										                  <div class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
							                              	style="background-color: rgba(0,0,0,0.5);">#${BoardList.wrtbtTitle }</div>
		
										            </c:if>

					                        </div>
					                      
					                          <c:if test="${BoardList.reAvlblEndDt == 9999 || BoardList.reAvlblEndDt == null }"	> 
					                      	
					                      			  <div class="w3-container w3-margin-top">
					                           
					                           		 <!--코멘트(베스트)-->
					                                 <c:if test="${BoardList.count > 0 }"	>
					                                 	 <!--코멘트 수-->
					                          			  <span class="w3-small w3-padding">Comment <span class="w3-badge w3-light-gray">${BoardList.count}</span></span>
					                                 	<p class="board-answer w3-round-large w3-padding w3-medium " style="margin-top: 0.5em;">${BoardList.subwrtbtText} </p>       	
										                    		
										            </c:if>
										             <c:if test="${BoardList.count == 0 }"	>
										                    		  
				
										            </c:if>
										             
					                            
					                        		</div>
					                      	
					                      	

					                     	 </c:if>
					                     	
					                     	 	 <c:if test="${BoardList.reAvlblEndDt != 9999 && BoardList.reAvlblEndDt != null }"	>
					                     	  
					                     	  	<div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
												</div>
					                     	  
					                     	  </c:if>
					                      
					                      </div>
					                     <!--
					                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapcoun${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('게시글',${BoardList.slctnNotiNo},${authUser.mbNo });"></i>
							                </div>  
					                      -->
					                     </c:if> 
					                      <c:if test="${BoardList.avlblEndDt != 9999 }"	>
					                      <div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
											</div>

					                      </c:if>
					                    </div>
					                    
					                    
										
							      
							      </c:if>
							      
							     <c:if test="${BoardList.wrtbtDstnct =='상담게시판' }"	>
							     
							     		   <div class="w3-display-container w3-card w3-round-large w3-margin-bottom main-banner w3-white ">
							     		    <c:if test="${BoardList.avlblEndDt == 9999 }"	>
							     		   <div class="noti-card counseling" value="${BoardList.slctnNotiNo}">
					                        <div class="w3-padding w3-text-grey w3-small">
					                            <span class="">Category - Question</span>
					                            <span class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
					                        </div>
					                   
					                 		        <div class="w3-display-container">
					                        	  <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		   <div class="w3-center w3-container">
							                            <h5 style="margin-bottom: 0em;"><strong>${BoardList.wrtbtTitle }</strong></h5>
							                        	</div>
							                        	  <div class="w3-container" style="margin-bottom: -1em;">
								                            <div class="w3-container w3-margin-top">
								                                <p class="w3-medium coheightcheck${status.index}"
								                                   style="margin-top: 0em; line-height: 200%; max-height: 10em;  text-overflow:ellipsis;overflow: hidden;">
								                                   ${BoardList.wrtbtText } </p>
								                                <span class="w3-medium w3-left w3-margin-bottom w3-text-blue readmore${status.index}"
								                                      style="font-size: 1.8vmin; margin-top: -1.5em;">(read more)</span>
								                            </div>
								                        </div>
										            </c:if>
										            <c:if test="${BoardList.coSrorgPath  != null }"	>
										                 <img class='anti' class='anti' src="${BoardList.coSrorgPath }" alt="이미지" style="width:100%">
										                  <div class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
							                              	style="background-color: rgba(0,0,0,0.5);">#${BoardList.wrtbtTitle }</div>
							                            	
										            </c:if>

					                        </div>
					                  
					                        <c:if test="${BoardList.reAvlblEndDt == 9999 || BoardList.reAvlblEndDt == null }"	> 
					                       <div class="w3-container w3-margin-top">  
						                        <c:if test="${BoardList.count > 0 }"	>
							                  
						                            <span class="w3-small w3-padding">Answers <span class="w3-badge w3-light-gray">${BoardList.count}</span></span>
						                            <p class="board-answer w3-round-large w3-padding w3-medium" style="font-size: 1.8vmin; margin-top: 0em; line-height: 200%; max-height: 4em; text-overflow: ellipsis; overflow: hidden;">${BoardList.subwrtbtText}</p>
						                        
								                    <div class="w3-container w3-center w3-padding">
								                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
								                    </div>
							                    		
							           		 </c:if>
							             	<c:if test="${BoardList.count == 0 }"	>
									                <div class="w3-container w3-center w3-padding">
								                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
								                    </div>    		  
	
							            	</c:if>
						            	</div>
						            	</c:if>
						            	 <c:if test="${BoardList.reAvlblEndDt != 9999 && BoardList.reAvlblEndDt != null }"	>
					                     	  
					                     	  	<div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
												</div>
					                     	  
					                     	  </c:if>
						            	</div>
					                         <!--
					                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapcoun${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('게시글',${BoardList.slctnNotiNo},${authUser.mbNo });"></i>
							                </div>  
					                      -->  
					                     </c:if> 
					                      <c:if test="${BoardList.avlblEndDt != 9999 }"	>
					                      <div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
											</div>

					                      </c:if> 
					                    </div>
					                    
					                    

							     
							     </c:if>
						

							    </c:otherwise>
			 
							</c:choose>
				

				    </c:when>
 					

				</c:choose>
						                
							
		  		
		  			</c:if>
                  </c:forEach>  
                    
                </div>
				</div>

				<div class="">	
				<div class="w3-col s12 m12 l4 w3-row-padding w3-margin-bottom"> 
				
				<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
                
                    <c:if test="${BoardList.orderNum%3 ==1 }"	>
		  		
						
		  			 <c:choose>
 
							<c:when test="${calList.year ==BoardList.year && calList.month ==BoardList.month && calList.day == BoardList.day }">
					
					 	 			
			                <c:choose>
			 
								 <c:when test="${BoardList.slctnNotiDstnct == '연구실'}">
								  		
								  <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  
								  
								  
						                <div class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
						              		 <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
							                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">
							                    	<c:choose>
													<c:when test="${BoardList.bk21EorgnzSuprtYn =='Y' }">
														<div class="w3-small"style="margin-bottom: -1.5em; height: 2.7em">
										                    <span class="w3-text-white w3-round-large" style="background: linear-gradient(141deg,rgba(255, 0, 0, 1), rgba(0, 0, 255, 1));">&nbsp;BK 21+&nbsp;</span>
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
							                        <img class='anti' src="${BoardList.storgPath }" alt="대학교 로고"
							                             style="width:100%; padding: 1em 1em 0 1em; height:83px;">
							                       
							                    </div>
							                    <div class="w3-container w3-center">
							                        <h4><strong>${BoardList.major}</strong></h4>
							                        <h4 style="height: 2em;"><strong>${BoardList.lab }</strong></h4>
							                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
							                    </div>
						                    
						                  	<div class="research-field w3-padding text-center">
												 <c:forEach items="${majorList}" var="majorList" varStatus="status">
							                        	<c:if test="${BoardList.slctnNotiNo == majorList2.slctnNotiNo }"	>
							                    		  <span class="w3-tag w3-light-grey w3-tiny  ">${majorList2.cdNm}</span>
							                    		</c:if>
							                        </c:forEach>
											</div>
						                    </div>
						                    <div class="w3-row-padding w3-padding">
												 	<div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                        </div>
							                        
													 <c:if test="${BoardList.slctnSemstr == '상시' }"	>
						                              <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">D-${BoardList.dday}</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">모집예정</span>
							                  			 	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">오늘마감</span>
							                  			 
							                    	</c:if>
											</div>
						                  
						                </div>
						         
								  

								

					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								   
							             
							               <div class="w3-display-container grad-banner-our w3-round-large w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
								                   <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								                   	<c:if test="${BoardList.slctnSemstr == '상시' }"	>
							                    		  
							                    		  <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                    	<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                  			 	
							                    	</c:if>
								                   
								                   
								                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								                        <h5 class="w3-padding" style="margin-bottom: 1em; height: 2em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.university} </strong><strong>${BoardList.graduate} ${BoardList.major} ${BoardList.lab}</strong></h5>
								                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
								                    </div>
								                    
								                    </div>
								                    
								                    <div class="w3-row-padding w3-padding">
								                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                        	</div>
								                        
								                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
								                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
							                    		
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
								                  				  	
								                    	</c:if>
								                    	<c:if test="${BoardList.percent < 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
								                  			   	
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘 마감</span>
								                  				
								                    	</c:if>								                       
								                    </div>
								                </div>								                
							          
									  
					                                     
					                </c:if>

							    </c:when>
			 					
							   
								 <c:when test="${BoardList.slctnNotiDstnct == '대학원'}">
								 
								 
								   <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  				
								  	  		    
								  	  		      
								                		<div class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
								              		 <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
									                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
									                    <div style="margin-bottom: 0em;">
									                        <img class='anti' src="${BoardList.storgPath }" alt="대학교 로고"
									                             style="width:100%; padding: 1em 1em 0 1em; height:83px;">
									                       
									                    </div>
									                    <div class="w3-container w3-center">
									                        <h4 style="height: 2em;"><strong>${BoardList.lab}</strong></h4>
									                        <p style="height: 2em; font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
									                    </div>
								                    
								                    <div class="w3-container">
								                    	<div class="w3-light-grey w3-tiny">
															 <c:if test="${BoardList.slctnSemstr == '상시' || BoardList.percent <0 }"	>
												                   <div class="w3-container " style="width: 0; height: 1px;"></div>
												             </c:if>
												             <c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
												             		<div class="w3-container w3-black" style="width: ${BoardList.percent}%; height: 1px;"></div>
												             </c:if>	
														</div>
								                    </div>
								                    </div>
								                    <div class="w3-row-padding w3-padding">
														 	<div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
									                            <i class="far fa-thumbtack w3-large" 
									                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
									                        </div>
															<span
																class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
																style="float: right;">
																          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
															                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">상시 모집</span>
														                    		
														                    	</c:if>
														                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
														                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">D-${BoardList.dday}</span>
														                  			
														                    	</c:if>
														                    	<c:if test="${BoardList.percent < 0 }"	>
														                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">모집예정</span>
														                  			  	
														                    	</c:if>
														                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
														                  			  <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">오늘마감</span>
														                    	</c:if>
															</span>
													</div>
								                  
								                </div>
								      
													  	  		    
								  	  		
	
					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								      <div class="w3-display-container grad-banner-our w3-round-large w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
					                    
					                    <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
					                      <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                      <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							               </c:if>
							               <c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                    	
							               </c:if>
					                    
					                   
					                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
					                        <h4 class="w3-padding w3-round-large" style="margin-bottom: 1em; height: 2em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.major}</strong><strong> ${BoardList.lab}</strong></h4>
					                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
					                    </div>
					                    
					                    
					                    </div>
					                    <div class="w3-row-padding w3-padding">
					                         <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                     <i class="far fa-thumbtack w3-large" 
							                     onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                 </div>
					                        
					                          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                                	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">D-${BoardList.dday}</span>
							                  			
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">모집예정</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">오늘 마감</span>
							                  			  	
							                    	</c:if>

					                    </div>
					                 </div>
								   
           
					                </c:if>

							              
							    </c:when>

							 
							        <c:otherwise>
							    
							      <c:if test="${BoardList.wrtbtDstnct =='일반게시판' }"	>
							      
							     
							      	   <div class="w3-display-container w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							      	   
							      	    <c:if test="${BoardList.avlblEndDt == 9999 }"	>
							      	   	<div class="noti-card counseling" value="${BoardList.slctnNotiNo}">
					                        <div class="w3-padding w3-text-grey w3-small">
					                            <span class="">Category - Ordinary</span>
					                            <span class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
					                        </div>
					                        <div class="w3-display-container">
					                        	  <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		   <div class="w3-center w3-container">
							                            <h5 style="margin-bottom: 0em;"><strong>${BoardList.wrtbtTitle }</strong></h5>
							                        	</div>
							                        	  <div class="w3-container" style="margin-bottom: -1em;">
								                            <div class="w3-container w3-margin-top">
								                                <p class="w3-medium coheightcheck${status.index}" 
								                                   style="margin-top: 0em; line-height: 200%; max-height: 10em;  text-overflow:ellipsis;overflow: hidden;">
								                                   ${BoardList.wrtbtText } </p>
								                                   
								                                   
								                                <span class="w3-medium w3-left w3-margin-bottom w3-text-blue readmore${status.index}"
								                                      style="font-size: 1.8vmin; margin-top: -1.5em;">(read more)</span>
								                                      
								                                      
								                            </div>
								                        </div>
										            </c:if>
										            <c:if test="${BoardList.coSrorgPath  != null }"	>
										                 <img class='anti' src="${BoardList.coSrorgPath }" alt="이미지" style="width:100%">
										                  <div class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
							                              	style="background-color: rgba(0,0,0,0.5);">#${BoardList.wrtbtTitle }</div>
		
										            </c:if>

					                        </div>
					                      
					                          <c:if test="${BoardList.reAvlblEndDt == 9999 || BoardList.reAvlblEndDt == null }"	> 
					                      	
					                      			  <div class="w3-container w3-margin-top">
					                           
					                           		 <!--코멘트(베스트)-->
					                                 <c:if test="${BoardList.count > 0 }"	>
					                                 	 <!--코멘트 수-->
					                          			  <span class="w3-small w3-padding">Comment <span class="w3-badge w3-light-gray">${BoardList.count}</span></span>
					                                 	<p class="board-answer w3-round-large w3-padding w3-medium " style="margin-top: 0.5em;">${BoardList.subwrtbtText} </p>       	
										                    		
										            </c:if>
										             <c:if test="${BoardList.count == 0 }"	>
										                    		  
				
										            </c:if>
										             
					                            
					                        		</div>
					                      	
					                      	

					                     	 </c:if>
					                     	
					                     	 	 <c:if test="${BoardList.reAvlblEndDt != 9999 && BoardList.reAvlblEndDt != null }"	>
					                     	  
					                     	  	<div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
												</div>
					                     	  
					                     	  </c:if>
					                      
					                      </div>
					                     <!--
					                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapcoun${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('게시글',${BoardList.slctnNotiNo},${authUser.mbNo });"></i>
							                </div>  
					                      -->
					                     </c:if> 
					                      <c:if test="${BoardList.avlblEndDt != 9999 }"	>
					                      <div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
											</div>

					                      </c:if>
					                    </div>
					                    
					                    
										
							      
							      </c:if>
							      
							     <c:if test="${BoardList.wrtbtDstnct =='상담게시판' }"	>
							     
							     		   <div class="w3-display-container w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							     		    <c:if test="${BoardList.avlblEndDt == 9999 }"	>
							     		   <div class="noti-card counseling" value="${BoardList.slctnNotiNo}">
					                        <div class="w3-padding w3-text-grey w3-small">
					                            <span class="">Category - Question</span>
					                            <span class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
					                        </div>
					                   
					                 		        <div class="w3-display-container">
					                        	  <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		   <div class="w3-center w3-container">
							                            <h5 style="margin-bottom: 0em;"><strong>${BoardList.wrtbtTitle }</strong></h5>
							                        	</div>
							                        	  <div class="w3-container" style="margin-bottom: -1em;">
								                            <div class="w3-container w3-margin-top">
								                                <p class="w3-medium coheightcheck${status.index}"
								                                   style="margin-top: 0em; line-height: 200%; max-height: 10em;  text-overflow:ellipsis;overflow: hidden;">
								                                   ${BoardList.wrtbtText } </p>
								                                <span class="w3-medium w3-left w3-margin-bottom w3-text-blue readmore${status.index}"
								                                      style="font-size: 1.8vmin; margin-top: -1.5em;">(read more)</span>
								                            </div>
								                        </div>
										            </c:if>
										            <c:if test="${BoardList.coSrorgPath  != null }"	>
										                 <img class='anti' src="${BoardList.coSrorgPath }" alt="이미지" style="width:100%">
										                  <div class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
							                              	style="background-color: rgba(0,0,0,0.5);">#${BoardList.wrtbtTitle }</div>
							                            	
										            </c:if>

					                        </div>
					                  
					                        <c:if test="${BoardList.reAvlblEndDt == 9999 || BoardList.reAvlblEndDt == null }"	> 
					                       <div class="w3-container w3-margin-top">  
						                        <c:if test="${BoardList.count > 0 }"	>
							                  
						                            <span class="w3-small w3-padding">Answers <span class="w3-badge w3-light-gray">${BoardList.count}</span></span>
						                            <p class="board-answer w3-round-large w3-padding w3-medium" style="font-size: 1.8vmin; margin-top: 0em; line-height: 200%; max-height: 4em; text-overflow: ellipsis; overflow: hidden;">${BoardList.subwrtbtText}</p>
						                        
								                    <div class="w3-container w3-center w3-padding">
								                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
								                    </div>
							                    		
							           		 </c:if>
							             	<c:if test="${BoardList.count == 0 }"	>
									                <div class="w3-container w3-center w3-padding">
								                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
								                    </div>    		  
	
							            	</c:if>
						            	</div>
						            	</c:if>
						            	 <c:if test="${BoardList.reAvlblEndDt != 9999 && BoardList.reAvlblEndDt != null }"	>
					                     	  
					                     	  	<div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
												</div>
					                     	  
					                     	  </c:if>
						            	</div>
					                         <!--
					                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapcoun${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('게시글',${BoardList.slctnNotiNo},${authUser.mbNo });"></i>
							                </div>  
					                      -->  
					                     </c:if> 
					                      <c:if test="${BoardList.avlblEndDt != 9999 }"	>
					                      <div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
											</div>

					                      </c:if> 
					                    </div>
					                    
					                    

							     
							     </c:if>
						

							    </c:otherwise>
							</c:choose>
				

				    </c:when>
 					

				</c:choose>
						                
		  		
		  			</c:if>
                  </c:forEach>  
                    
                </div>
			</div>		

            <div class="">    
          <div class="w3-col s12 m12 l4 w3-row-padding w3-margin-bottom">
				
				
				<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
                
                    <c:if test="${BoardList.orderNum%3 ==2 }"	>
		  		
						
		  			 <c:choose>
 
							<c:when test="${calList.year ==BoardList.year && calList.month ==BoardList.month && calList.day == BoardList.day }">
					
					 	 			
			                <c:choose>
			 
								 <c:when test="${BoardList.slctnNotiDstnct == '연구실'}">
								  		
								  <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  
								  
								  
						                <div class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
						              		 <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
							                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">
							                    	<c:choose>
													<c:when test="${BoardList.bk21EorgnzSuprtYn =='Y' }">
														<div class="w3-small"style="margin-bottom: -1.5em; height: 2.7em">
										                    <span class="w3-text-white w3-round-large" style="background: linear-gradient(141deg,rgba(255, 0, 0, 1), rgba(0, 0, 255, 1));">&nbsp;BK 21+&nbsp;</span>
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
							                        <img class='anti' src="${BoardList.storgPath }" alt="대학교 로고"
							                             style="width:100%; padding: 1em 1em 0 1em; height:83px;">
							                       
							                    </div>
							                    <div class="w3-container w3-center">
							                        <h4><strong>${BoardList.major}</strong></h4>
							                        <h4 style="height: 2em;"><strong>${BoardList.lab }</strong></h4>
							                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
							                    </div>
						                    
						                  	<div class="research-field w3-padding text-center">
												 <c:forEach items="${majorList}" var="majorList" varStatus="status">
							                        	<c:if test="${BoardList.slctnNotiNo == majorList2.slctnNotiNo }"	>
							                    		  <span class="w3-tag w3-light-grey w3-tiny  ">${majorList2.cdNm}</span>
							                    		</c:if>
							                        </c:forEach>
											</div>
						                    </div>
						                    <div class="w3-row-padding w3-padding">
												 	<div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                        </div>
							                        
													 <c:if test="${BoardList.slctnSemstr == '상시' }"	>
						                              <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">D-${BoardList.dday}</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">모집예정</span>
							                  			 	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
							                              style="float :right;">오늘마감</span>
							                  			 
							                    	</c:if>
											</div>
						                  
						                </div>
						         
								  

								

					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								   
							             
							               <div class="w3-display-container grad-banner-our w3-round-large w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
								                   <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
								                   	<c:if test="${BoardList.slctnSemstr == '상시' }"	>
							                    		  
							                    		  <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                    	<div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                  			 	
							                    	</c:if>
								                   
								                   
								                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
								                        <h5 class="w3-padding" style="margin-bottom: 1em; height: 2em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.university} </strong><strong>${BoardList.graduate} ${BoardList.major} ${BoardList.lab}</strong></h5>
								                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
								                    </div>
								                    
								                    </div>
								                    
								                    <div class="w3-row-padding w3-padding">
								                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                        	</div>
								                        
								                        <c:if test="${BoardList.slctnSemstr == '상시' }"	>
								                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">상시 모집</span>
							                    		
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">D-${BoardList.dday}</span>
								                  				  	
								                    	</c:if>
								                    	<c:if test="${BoardList.percent < 0 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">모집예정</span>
								                  			   	
								                    	</c:if>
								                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
								                    	<span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
								                              style="float :right;">오늘 마감</span>
								                  				
								                    	</c:if>								                       
								                    </div>
								                </div>								                
							          
									  
					                                     
					                </c:if>

							    </c:when>
			 					
							   
								 <c:when test="${BoardList.slctnNotiDstnct == '대학원'}">
								 
								 
								   <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  				
								  	  		    
								  	  		      
								                		<div class="w3-display-container w3-round-large w3-white w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
								              		 <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
									                    <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
									                    <div style="margin-bottom: 0em;">
									                        <img class='anti' src="${BoardList.storgPath }" alt="대학교 로고"
									                             style="width:100%; padding: 1em 1em 0 1em; height:83px;">
									                       
									                    </div>
									                    <div class="w3-container w3-center">
									                        <h4 style="height: 2em;"><strong>${BoardList.lab}</strong></h4>
									                        <p style="height: 2em; font-size: 1.8vmin;">${BoardList.slctnTitle}</p>
									                    </div>
								                    
								                    <div class="w3-container">
								                    	<div class="w3-light-grey w3-tiny">
															 <c:if test="${BoardList.slctnSemstr == '상시' || BoardList.percent <0 }"	>
												                   <div class="w3-container " style="width: 0; height: 1px;"></div>
												             </c:if>
												             <c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
												             		<div class="w3-container w3-black" style="width: ${BoardList.percent}%; height: 1px;"></div>
												             </c:if>	
														</div>
								                    </div>
								                    </div>
								                    <div class="w3-row-padding w3-padding">
														 	<div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
									                            <i class="far fa-thumbtack w3-large" 
									                            onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
									                        </div>
															<span
																class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
																style="float: right;">
																          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
															                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">상시 모집</span>
														                    		
														                    	</c:if>
														                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
														                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">D-${BoardList.dday}</span>
														                  			
														                    	</c:if>
														                    	<c:if test="${BoardList.percent < 0 }"	>
														                    	 <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">모집예정</span>
														                  			  	
														                    	</c:if>
														                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
														                  			  <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
													                              style="float :right;">오늘마감</span>
														                    	</c:if>
															</span>
													</div>
								                  
								                </div>
								      
													  	  		    
								  	  		
	
					                                      
					                </c:if>
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
								   
								      <div class="w3-display-container grad-banner-our w3-round-large w3-margin-bottom w3-card scrapnoti${BoardList.slctnNotiNo }">
					                    
					                    <div class="noti-card" onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
					                      <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                      <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnSemstr}</div>
							               </c:if>
							               <c:if test="${BoardList.slctnSemstr != '상시' }"	>
							                <div class="w3-padding w3-text-grey w3-small" style="margin-bottom: -1.5em;">${BoardList.slctnYycl}년 ${BoardList.slctnSemstr}</div>
							                    	
							               </c:if>
					                    
					                   
					                    <div class="w3-container w3-center w3-padding" style="margin-bottom: -1em;">
					                        <h4 class="w3-padding w3-round-large" style="margin-bottom: 1em; height: 2em;"><strong style="color: ${BoardList.symbolColorNm};">${BoardList.major}</strong><strong> ${BoardList.lab}</strong></h4>
					                        <p style="font-size: 1.8vmin; height: 2em;">${BoardList.slctnTitle}</p>
					                    </div>
					                    
					                    
					                    </div>
					                    <div class="w3-row-padding w3-padding">
					                         <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapnoti${BoardList.slctnNotiNo}">
							                     <i class="far fa-thumbtack w3-large" 
							                     onclick="doScrap('모집공고',${BoardList.slctnNotiNo},'',${authUser.mbNo });"></i>
							                 </div>
					                        
					                          <c:if test="${BoardList.slctnSemstr == '상시' }"	>
					                                	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">상시 모집</span>
							                    		
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">D-${BoardList.dday}</span>
							                  			
							                    	</c:if>
							                    	<c:if test="${BoardList.percent < 0 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">모집예정</span>
							                  			  	
							                    	</c:if>
							                    	<c:if test="${BoardList.slctnSemstr != '상시' && BoardList.percent >= 99 }"	>
							                    	      	
					                        <span class="noti-endtext w3-tag w3-round-large w3-light-grey w3-text-blue"
					                              style="float :right;">오늘 마감</span>
							                  			  	
							                    	</c:if>

					                    </div>
					                 </div>
								   
           
					                </c:if>

							              
							    </c:when>

							 
							        <c:otherwise>
							    
							      <c:if test="${BoardList.wrtbtDstnct =='일반게시판' }"	>
							      
							     
							      	   <div class="w3-display-container w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							      	   
							      	    <c:if test="${BoardList.avlblEndDt == 9999 }"	>
							      	   	<div class="noti-card counseling" value="${BoardList.slctnNotiNo}">
					                        <div class="w3-padding w3-text-grey w3-small">
					                            <span class="">Category - Ordinary</span>
					                            <span class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
					                        </div>
					                        <div class="w3-display-container">
					                        	  <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		   <div class="w3-center w3-container">
							                            <h5 style="margin-bottom: 0em;"><strong>${BoardList.wrtbtTitle }</strong></h5>
							                        	</div>
							                        	  <div class="w3-container" style="margin-bottom: -1em;">
								                            <div class="w3-container w3-margin-top">
								                                <p class="w3-medium coheightcheck${status.index}" 
								                                   style="margin-top: 0em; line-height: 200%; max-height: 10em;  text-overflow:ellipsis;overflow: hidden;">
								                                   ${BoardList.wrtbtText } </p>
								                                   
								                                   
								                                <span class="w3-medium w3-left w3-margin-bottom w3-text-blue readmore${status.index}"
								                                      style="font-size: 1.8vmin; margin-top: -1.5em;">(read more)</span>
								                                      
								                                      
								                            </div>
								                        </div>
										            </c:if>
										            <c:if test="${BoardList.coSrorgPath  != null }"	>
										                 <img class='anti' src="${BoardList.coSrorgPath }" alt="이미지" style="width:100%">
										                  <div class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
							                              	style="background-color: rgba(0,0,0,0.5);">#${BoardList.wrtbtTitle }</div>
		
										            </c:if>

					                        </div>
					                      
					                          <c:if test="${BoardList.reAvlblEndDt == 9999 || BoardList.reAvlblEndDt == null }"	> 
					                      	
					                      			  <div class="w3-container w3-margin-top">
					                           
					                           		 <!--코멘트(베스트)-->
					                                 <c:if test="${BoardList.count > 0 }"	>
					                                 	 <!--코멘트 수-->
					                          			  <span class="w3-small w3-padding">Comment <span class="w3-badge w3-light-gray">${BoardList.count}</span></span>
					                                 	<p class="board-answer w3-round-large w3-padding w3-medium " style="margin-top: 0.5em;">${BoardList.subwrtbtText} </p>       	
										                    		
										            </c:if>
										             <c:if test="${BoardList.count == 0 }"	>
										                    		  
				
										            </c:if>
										             
					                            
					                        		</div>
					                      	
					                      	

					                     	 </c:if>
					                     	
					                     	 	 <c:if test="${BoardList.reAvlblEndDt != 9999 && BoardList.reAvlblEndDt != null }"	>
					                     	  
					                     	  	<div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
												</div>
					                     	  
					                     	  </c:if>
					                      
					                      </div>
					                     <!--
					                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapcoun${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('게시글',${BoardList.slctnNotiNo},${authUser.mbNo });"></i>
							                </div>  
					                      -->
					                     </c:if> 
					                      <c:if test="${BoardList.avlblEndDt != 9999 }"	>
					                      <div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
											</div>

					                      </c:if>
					                    </div>
					                    
					                    
										
							      
							      </c:if>
							      
							     <c:if test="${BoardList.wrtbtDstnct =='상담게시판' }"	>
							     
							     		   <div class="w3-display-container w3-card w3-round-large w3-margin-bottom main-banner w3-white">
							     		    <c:if test="${BoardList.avlblEndDt == 9999 }"	>
							     		   <div class="noti-card counseling" value="${BoardList.slctnNotiNo}">
					                        <div class="w3-padding w3-text-grey w3-small">
					                            <span class="">Category - Question</span>
					                            <span class="w3-right"><i class="fas fa-ellipsis-h"></i></span>
					                        </div>
					                   
					                 		        <div class="w3-display-container">
					                        	  <c:if test="${BoardList.coSrorgPath  == null }"	>
						                    		   <div class="w3-center w3-container">
							                            <h5 style="margin-bottom: 0em;"><strong>${BoardList.wrtbtTitle }</strong></h5>
							                        	</div>
							                        	  <div class="w3-container" style="margin-bottom: -1em;">
								                            <div class="w3-container w3-margin-top">
								                                <p class="w3-medium coheightcheck${status.index}"
								                                   style="margin-top: 0em; line-height: 200%; max-height: 10em;  text-overflow:ellipsis;overflow: hidden;">
								                                   ${BoardList.wrtbtText } </p>
								                                <span class="w3-medium w3-left w3-margin-bottom w3-text-blue readmore${status.index}"
								                                      style="font-size: 1.8vmin; margin-top: -1.5em;">(read more)</span>
								                            </div>
								                        </div>
										            </c:if>
										            <c:if test="${BoardList.coSrorgPath  != null }"	>
										                 <img class='anti' src="${BoardList.coSrorgPath }" alt="이미지" style="width:100%">
										                  <div class="w3-large w3-display-bottomleft w3-padding w3-text-white w3-round-large"
							                              	style="background-color: rgba(0,0,0,0.5);">#${BoardList.wrtbtTitle }</div>
							                            	
										            </c:if>

					                        </div>
					                  
					                        <c:if test="${BoardList.reAvlblEndDt == 9999 || BoardList.reAvlblEndDt == null }"	> 
					                       <div class="w3-container w3-margin-top">  
						                        <c:if test="${BoardList.count > 0 }"	>
							                  
						                            <span class="w3-small w3-padding">Answers <span class="w3-badge w3-light-gray">${BoardList.count}</span></span>
						                            <p class="board-answer w3-round-large w3-padding w3-medium" style="font-size: 1.8vmin; margin-top: 0em; line-height: 200%; max-height: 4em; text-overflow: ellipsis; overflow: hidden;">${BoardList.subwrtbtText}</p>
						                        
								                    <div class="w3-container w3-center w3-padding">
								                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
								                    </div>
							                    		
							           		 </c:if>
							             	<c:if test="${BoardList.count == 0 }"	>
									                <div class="w3-container w3-center w3-padding">
								                        <button class="w3-button w3-block w3-border w3-white w3-round-large w3-text-grey counselingreply" style="letter-spacing: 2px;" value="${BoardList.slctnNotiNo}">답변하기</button>
								                    </div>    		  
	
							            	</c:if>
						            	</div>
						            	</c:if>
						            	 <c:if test="${BoardList.reAvlblEndDt != 9999 && BoardList.reAvlblEndDt != null }"	>
					                     	  
					                     	  	<div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
												</div>
					                     	  
					                     	  </c:if>
						            	</div>
					                         <!--
					                        <div class="doScrap w3-padding w3-display-bottomleft w3-display w3-margin-left w3-margin-top w3-animate-opacity w3-white w3-round-large do-scrapcoun${BoardList.slctnNotiNo}">
							                            <i class="far fa-thumbtack w3-large" 
							                            onclick="doScrap('게시글',${BoardList.slctnNotiNo},${authUser.mbNo });"></i>
							                </div>  
					                      -->  
					                     </c:if> 
					                      <c:if test="${BoardList.avlblEndDt != 9999 }"	>
					                      <div class='w3-container w3-padding w3-text-light-grey'>
											 	<h4><b>사용자에 의해 삭제된 게시물입니다.</b></h4>
											</div>

					                      </c:if> 
					                    </div>
					                    
					                    

							     
							     </c:if>
						

							    </c:otherwise>
			 
							</c:choose>
				

				    </c:when>
 					

				</c:choose>
				</c:if>
   		 	</c:forEach>  
		</div>
		</div>	
	</div>
</c:forEach>
</div>
</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/study.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/doscrap.js"></script>	
	
</body>
</html>