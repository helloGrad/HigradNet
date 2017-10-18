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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/antimoderate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/antimoder.js"></script>
	

<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.min.css">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/study.css" rel="stylesheet">

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
.distinct-line {
	padding-top: 2.5em;
}


.grad-banner {
            box-shadow: 3px 3px 10px rgba(179, 0, 0, 0.3), -1px -1px 10px rgba(255, 153, 153, 0.3);
           
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
		
		
	});
 

</script>   
</head>
<body>


<c:import url="/WEB-INF/views/include/header.jsp" />
<c:import url="/WEB-INF/views/include/subHeader.jsp" />

<div class="row">
    <div class="container">



			<div class="w3-col s12 m12 l12 w3-container">
				<h3>
					<div style="float: left; margin-right: 0.3em;">대학원 모집공고</div>
					<br>
				</h3>

				<hr>

				<div class="w3-row">

					<c:forEach items="${BoardList }" var="BoardList" varStatus="status">

						<c:choose>


								<c:when test="${BoardList.slctnNotiDstnct == '대학원'}">
								 
								 
								   <c:if test="${BoardList.pchrgYn =='Y' }"	>
								  		
								  		
								  <div class="w3-col s12 m6 l3 w3-row-padding w3-margin-bottom ">
			                		<div class="w3-display-container w3-round-large w3-white  w3-card scrapnoti${BoardList.slctnNotiNo }">
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
			            </div>
			            
                     
					                </c:if>
							              
							    </c:when>

						</c:choose>

					</c:forEach>


				</div>

				<div class="w3-row distinct-line">

					<c:forEach items="${BoardList }" var="BoardList" varStatus="status">

						<c:choose>


							<c:when test="${BoardList.slctnNotiDstnct == '대학원'}">



										 
								 <c:if test="${BoardList.pchrgYn =='N' }"	>
								<div class="w3-col s12 m6 l3 w3-row-padding w3-margin-bottom">
								    
								    
								    <div class="w3-display-container grad-banner-our w3-round-large  w3-card scrapnoti${BoardList.slctnNotiNo }">
					                    
					                    <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=대학원'">
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
					                 
					                 
								   </div>
					                                     
					                </c:if>

							</c:when>

						</c:choose>

					</c:forEach>

				</div>
			</div>


			<div class="w3-col s12 m12 l12 w3-container">
			<c:forEach items="${codeList2 }" var="codeList2" varStatus="status"> 
          
          	<c:if test="${codeList2.cdDstnct == '학과' }"	>
          	
          	<div class="w3-col s12 m12 l12 w3-container">
          		 <h3>
                <div style="float: left; margin-right: 0.3em;">${codeList2.cdNm }</div>
                <br>
	            </h3>
	          
	            <hr>
	            
	       </div>     
	            
	         <div class="w3-row">
	         		
	         		  <c:forEach items="${majorList }" var="majorList" varStatus="status">
           
		          	<c:if test="${majorList.spCdNm == codeList2.cdNm }"	>
		          	
		          		
		          		
		          		
		          			<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
		          			
		          			
		          			<c:if test="${majorList.slctnNotiNo == BoardList.slctnNotiNo}"	>
		          			
		          			
		          			 <c:choose>
		          				 <c:when test="${BoardList.slctnNotiDstnct == '연구실'}">
								  		
								  <c:if test="${BoardList.pchrgYn =='Y' }"	>
								
								
										<div class="w3-col s12 m6 l3 w3-row-padding w3-margin-bottom">
						                <div class="w3-display-container w3-round-large w3-white  w3-card scrapnoti${BoardList.slctnNotiNo }">
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
												 <c:forEach items="${majorList2}" var="majorList2" varStatus="status">
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
						            </div>
								
             
					                </c:if>
								 
    
							    </c:when>
		          	
		          			</c:choose>
		          	
		          			
		          			</c:if>
         					</c:forEach>

		          	</c:if>
         
           
           </c:forEach>
	         
	         
	         </div>            
         	<div class="w3-row">
         	
         		<c:forEach items="${majorList }" var="majorList" varStatus="status">
           
		          	<c:if test="${majorList.spCdNm == codeList2.cdNm }"	>
		          	
		          		
		          		
		          		
		          		<c:forEach items="${BoardList }" var="BoardList" varStatus="status">
		          		
		          		
		          			<c:if test="${majorList.slctnNotiNo == BoardList.slctnNotiNo}"	>
		          				
		          				<c:choose>
		          			
		          				 <c:when test="${BoardList.slctnNotiDstnct == '연구실'}">
								  		
								 
								   <c:if test="${BoardList.pchrgYn =='N' }"	>
								   
									<div class="w3-col s12 m6 l3 w3-row-padding w3-margin-bottom">
							             
							               <div class="w3-display-container grad-banner-our w3-round-large  w3-card scrapnoti${BoardList.slctnNotiNo }">
								                   <div onclick="location.href='${pageContext.servletContext.contextPath }/noti/detail?no=${BoardList.slctnNotiNo}&tabnm=연구실'">
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
							            </div>								   					                                     
					                </c:if>								 								 							              
							    </c:when>		          	
		          			</c:choose>		          			          			
		          			</c:if>
         			</c:forEach>
		          	</c:if>
             </c:forEach>         	
         	</div>   
                  	         	
         </c:if>          
     </c:forEach>
     </div>
</div>
</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/doscrap.js"></script>	
</body>
</html>