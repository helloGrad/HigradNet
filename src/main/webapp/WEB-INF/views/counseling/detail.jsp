<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
pageContext.setAttribute("newLine", "\n");
%>                  
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>하이그래드넷</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/antimoderate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/antimoder.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script> --%>  
		  
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">

		
<style>

.answers {
    background-color: rgb(250,250,252);
}

.question {
	font-size : 1.5em;
    font-weight: bold;
}
.remove-btn {
	float : right;
}
.web-volunteer {
	font-size: 1.5em;
}
.info {
	border-top: 1px solid lightgray;
}
.interest {
	color : gray;
}
.option {
	float : right;
}
p {
	line-height: 170%;
}
.disabled {
	pointer-events: none;
   	cursor: default;
}
.winter { 
	border:7px solid #FF8080; 
	background-color: #FF8080;
	border-radius: 8px;
}
.hide{
	display:none;  
}		
select {
	-webkit-appearance: none; 
	-moz-appearance: none;   
	appearance: none;       
}
select::-ms-expand {
	display: none;           
}	

textarea {
	width:300px; 
	overflow:visible;
} 
</style>   
</head>

<script>

    function resize(obj) {
      obj.style.height = "1px";
      obj.style.height = (20+obj.scrollHeight)+"px";
    }
    
	var list = [];
	var counselingPrnts = JSON.parse('${jsoncounselingPrnts}');
	var existLike = JSON.parse('${jsonexistLike}');
	var counselingReply = JSON.parse('${jsoncounselingReply}');

	$(function() {
		
		var authUser= $("#authUser").val();
		var replysize = $("#replysize").val();

		var type = "${type}";
		
		var existLikelist = []; 
	
		if (type === 'prnts') {
			
			//div_hide();
		}
		
		//if (replysize == 0) { 

			//if (type === 'prnts') {

			//	div_hide();
			//}

		//} else {

			//div_hide();
		
		//}
	
    	
    	
		if(authUser == null || authUser == "" ){
			
		}else{
			

			var scrapList=JSON.parse('${scrapList}');
			for(var i=0;i<scrapList.length;i++){

				if(scrapList[i].prntsDstnct==='게시글'){
					
					
					$('.do-scrapcoun' + scrapList[i].prntsNo).addClass('w3-text-red');
				}
			};	
			
		};	
		

		for( var i=0; i<existLike.length; i++){
	
			if(existLike[i].wrtbtNo == counselingPrnts[0].wrtbtNo){
			
				var link ="like"+existLike[i].wrtbtNo+"like";
				
				
				list.push(link);
				
				$('.'+link).addClass("w3-text-red");

			}
	
		}
		
			
			for( var i=0; i<counselingReply.length; i++){
				
				for( var j=0; j<existLike.length; j++){
				
				if(existLike[j].wrtbtNo == counselingReply[i].wrtbtNo){
			
	
					var link ="like"+existLike[j].wrtbtNo+"like";

					var dislink ="like"+existLike[j].wrtbtNo+"dislike";
					
					list.push(link);
					
					
					list.push(dislink);
					
					$('.'+link).addClass("w3-text-red");
					$('.'+dislink).addClass("w3-text-red");
					
				
				}
			}
			
			
		}
		

		$(document).ready(function() {

			$("#myBtn").click(function() {
				
				
				if(authUser === null || authUser===''){
					
		    		
					$("#loginForm").css({
					"display" : "block"
					});
					
					
				}else{
					
					//var con = document.getElementById("reply-form");

					//if (con.style.display == 'none') {
					//	con.style.display = 'block';
					//} else {
					//	con.style.display = 'none';
					//}

				}

			});
			
			$('#writrInfoOpngYn2 li > a').on('click', function() { 

				
				 document.getElementById("writrInfoOpngYn").innerHTML = 
					 
					 "<option  class='hide' value='Y'></option>"+
					  "<option value='N' selected='selected'>비공개로 작성하기</option>";
			});
			
		

		});
		
		

		
	

	})
	
	
	function deletecoun( value) {
		
		var authUser= $("#authUser").val();
		if(authUser === null || authUser==='' || authUser=='undefined'){
			
			$("#loginForm").css({
				"display" : "block"
			});
			
			return;
			
		}else{
			
		
				
				location.href='${pageContext.servletContext.contextPath }/counseling/delete?id='+value;	
		

			
		}
		
		
		
		
	}

	
	function div_show() {

		document.getElementById("reply-form").style.display = "block";

	}

	function div_hide() {
		document.getElementById("reply-form").style.display = "none";
	}

	
	function counselingreplyinsert() {

		event.preventDefault();

		var authUser= $("#authUser").val();
		if(authUser === null || authUser===''){
			
			$("#loginForm").css({
				"display" : "block"
			});
			return;
			
		}
		
		var prntsWrtbtNo=$("#prntsWrtbtNo").val();
		var wrtbtText = $("#wrtbtText2").val();			
		var writrInfoOpngYn = $("#writrInfoOpngYn").val();				
		var bbsNo = $("#bbsNo").val();

		var replylist = {
			prntsWrtbtNo : prntsWrtbtNo,
			wrtbtText : wrtbtText,
			writrInfoOpngYn : writrInfoOpngYn,
			bbsNo : bbsNo
		};


		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			url : "${pageContext.request.contextPath }/counseling/api/replywrite",
			type : "post",
			dataType : "json", 
			data : JSON.stringify(replylist),
			contentType : 'application/json; charset=utf-8', 

			success : function(response) {

				if (response.result === "fail") {

					console.error(response.message);
					return;
				}

				location.reload();

			},
			error : function(jqXHR, status, e) {
				
				console.error(status + " : " + e);
				console.log(jqXHR);
			}
		});

	}

	function likeupdate(num, value) {

	

		var authUser= $("#authUser").val();
		if(authUser === null || authUser===''){
			
			$("#loginForm").css({
				"display" : "block"
			});
			
			return;
			
		}
	

		var likevalue = {
				wrtbtNo : num,
				mbNo : authUser,
				infroDstnct : value
			};
		
		
		$.ajax({
			url : "${pageContext.request.contextPath }/counseling/api/likeadd",
			type : "post",
			dataType : "json",
			data : JSON.stringify(likevalue),
			contentType : 'application/json; charset=utf-8',

			success : function(response) {

				if (response.result === "fail") {

					console.error(response.message);
					return;
				}

				
				//location.reload();
				
				
				if(value == 'like'){

					 var check=0;
					 var result;
					 
					 for( var i=0; i<counselingReply.length; i++){
						 
						 if(num== counselingReply[i].wrtbtNo){
							 
							 check=1;
							 
						 }
						 
					 }
					 
					 if(check ==1){ 
						 
							for( var i=0; i<existLike.length; i++){
								if(num== counselingReply[i].wrtbtNo){
									
									result = existLike[i].infoDstnct;
								}
								
								
							}
							

						 //	$(".like"+num+"like").html("<a class='like"+response.data.wrtbtNo+"like' onclick='likeupdate("+response.data.wrtbtNo+",'like')' value='like'> Up <span class='w3-badge w3-white'>"+response.data.rcmdCo+"</span></a>");
							 if($(".like"+num+"dislike").hasClass("w3-text-red") === true) {
								 
								 $(".like"+num+"dislike").removeClass("w3-text-red");
								 
								 $(".like"+num+"like").removeClass("w3-text-red");
								 
								 $(".like"+num+"likes").text(response.data.rcmdCo);
								 $(".like"+num+"dislikes").text(response.data.ncmdCo);
								}else{
									
									 $(".like"+num+"dislike").addClass("w3-text-red");
									 $(".like"+num+"like").addClass("w3-text-red");
									 $(".like"+num+"likes").text(response.data.rcmdCo);
									 $(".like"+num+"dislikes").text(response.data.ncmdCo);
								}		
						
						
						 
					 }else{ 
					 	//$(".like"+num+"like").html("<a class='like"+response.data.wrtbtNo+"like' onclick='likeupdate("+response.data.wrtbtNo+",'like')' value='like'> 공감 <span class='w3-badge w3-white'>"+response.data.rcmdCo+"</span></a>");
	
					 	 if($(".like"+num+"like").hasClass("w3-text-red") === true) {
					 		 
					 		$(".like"+num+"likes").text(response.data.rcmdCo);
							 $(".like"+num+"like").removeClass("w3-text-red");
							}else{
								
								$(".like"+num+"likes").text(response.data.rcmdCo);
								 $(".like"+num+"like").addClass("w3-text-red");
							}

						}

					
				}else{
					
					for( var i=0; i<existLike.length; i++){
						if(num== counselingReply[i].wrtbtNo){
							
							result = existLike[i].infoDstnct;
						}
						
						
					}
					
					
						// $(".like"+num+"dislike").html("<a class='like"+response.data.wrtbtNo+"dislike' onclick='likeupdate("+response.data.wrtbtNo+",'dislike')' value='dislike'> Down <span class='w3-badge w3-white'>"+response.data.ncmdCo+"</span></a>");

						 if($(".like"+num+"dislike").hasClass("w3-text-red") === true) {
							 $(".like"+num+"dislike").removeClass("w3-text-red");
							 $(".like"+num+"like").removeClass("w3-text-red");
							 
							 $(".like"+num+"likes").text(response.data.rcmdCo);
							 $(".like"+num+"dislikes").text(response.data.ncmdCo);
							}else{
								
								 $(".like"+num+"dislike").addClass("w3-text-red");
								 $(".like"+num+"like").addClass("w3-text-red");
								 
								 $(".like"+num+"likes").text(response.data.rcmdCo);
								 $(".like"+num+"dislikes").text(response.data.ncmdCo);
							}	
				
					
						
					
				}
				
			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
				console.log(jqXHR);
			}
		});
	}
</script>
<body>


<c:import url="/WEB-INF/views/include/header.jsp" />
	
	
<div class="w3-row">
<div class="container">
    <div class="w3-content" style="max-width: 768px;">
        <div class="w3-col s12 m12 l12">
            <!--질문 시작-->
            <div class="w3-margin-bottom">
                <div class="w3-padding w3-text-grey w3-medium">
               <c:if test="${counselingPrnts. wrtbtDstnct =='일반게시판' }"	> 
           			<span> Ordinary</span>
                   
               </c:if>   
               <c:if test="${counselingPrnts. wrtbtDstnct =='상담게시판' }"	> 
           
                    <span> Question Asked</span>
               </c:if>  
                    
                </div>
                
                       
				
				
                <div class="w3-container">
                
		                <c:if test="${counselingPrnts.avlblEndDt == 9999 }"	>
		                 <h3><b>${counselingPrnts.wrtbtTitle }</b></h3>
						</c:if>
						<c:if test="${counselingPrnts.avlblEndDt != 9999 }"	>
						   <h3><b>사용자에 의해 삭제된 게시물입니다.</b></h3>
						</c:if>
                   
                    
                    	
                <h6>
                <c:if test="${counselingPrnts.writrInfoOpngYn =='Y' }"	>
 
                <c:choose>
 
					 <c:when test="${counselingPrnts.birdt == null and counselingPrnts.agrg == null}">
				              없음
				    </c:when>
 					
				    <c:when test="${counselingPrnts.birdt == null}">
				       ${counselingPrnts.nknm}, ${counselingPrnts.agrg }대
				    </c:when>
				 
				    <c:when test="${counselingPrnts.agrg == null }">
				        ${counselingPrnts.nknm}, ${counselingPrnts.birdt }대
				    </c:when>
				 
				    <c:otherwise>
				        기타
				    </c:otherwise>
 
				</c:choose>

                </c:if>
                
                
                <c:if test="${counselingPrnts.writrInfoOpngYn =='N' }"	>
                                      비공개
                </c:if>
                    <span class="w3-text-grey">• ${counselingPrnts.avlblBeginDt }에 작성</span></h6>                       
					
                </div>
                
                
				<c:if test="${counselingPrnts.avlblEndDt == 9999 }"	>
                <div class="w3-container" style="line-height: 200%">
                    <p class="w3-padding">
                    ${fn:replace(counselingPrnts.wrtbtText, newLine,"<br>") }
                    </p>
                     <c:forEach items="${fileList }" var="list" varStatus="status">
					  <img class='anti' src="${list.storgPath }" style="max-width: 100%; height: auto;" >  
					</c:forEach>
					
                </div>
				</c:if>
				<c:if test="${counselingPrnts.avlblEndDt != 9999 }"	>
				  <div class="w3-container" style="line-height: 200%">
                    <p class="w3-padding">
                   	 사용자에 의해 삭제된 게시물입니다. 
                    </p>
                   
					
                </div>
				</c:if>
				
				
                <div class="w3-container w3-bar w3-border-bottom w3-padding">
                    <button class="w3-button do-scrapcoun${counselingPrnts.wrtbtNo} doScrap"  onclick="doScrap('게시글',${counselingPrnts.wrtbtNo},'',${authUser.mbNo });">
                        <span class="fa-layers fa-fw" style="font-size: 2.5em;">
                        <i class="fal fa-thumbtack"></i>
                        </span>
                    </button>
                    
                      <button class="w3-button like${counselingPrnts.wrtbtNo }like" onclick="likeupdate(${counselingPrnts.wrtbtNo },'like')" value="like">
                        <span class="fa-layers fa-fw" style="font-size: 2.5em;">
                        <i class="fal fa-heart"></i>
                        <span class="fa-layers-counter fa-layers-bottom-right like${counselingPrnts.wrtbtNo }likes">${counselingPrnts.rcmdCo} </span>
                        </span>
                    </button>
                  
                    
                    <button class="w3-button">
                        <span class="fa-layers fa-fw" style="font-size: 2.5em;">
                        <i class="fal fa-comment-alt"></i>
                            <span class="fa-layers-counter fa-layers-bottom-right">${fn:length(counselingReplyList)}</span>
                            
                        </span>
                    </button>
                    
                    
                   		  <div class="w3-button w3-padding-small w3-white w3-border w3-border-white w3-round-large disabled">
                     	   조회수 <span class="w3-badge w3-white">${counselingPrnts.findCo }</span>
                   		 </div>
                   		
                   		 <c:if test="${counselingPrnts.recount  == 0  && authUser.mbNo ==counselingPrnts.mbNo && counselingPrnts.avlblEndDt == 9999}"	>
			                                   	
			                 	<button class="w3-button w3-right" onclick="deletecoun(${counselingPrnts.wrtbtNo })" >
		                        <span class="fa-layers fa-fw" style="font-size: 2.5em;">
		                        <i class="fal fa-times"></i>
		                        </span>
		                  	  </button>                   	
			             </c:if>
                   	
                  <c:if test="${counselingPrnts.avlblEndDt == 9999 }"	>
             			<div class="row w3-margin">
						<c:forEach items="${fileList }" var="list" varStatus="status">
						<a id="down" href="${pageContext.servletContext.contextPath }/download?no=${list.apndngFileNo}">${list.apndngFileNm }</a>
						</c:forEach>
						</div>
		             
             
				</c:if>	
                   		 
                   	 	 
                   		 
                </div>
                <div class="w3-container w3-bar">
                    <div class="w3-bar-item">
                        <h5>Share your wisdom with us.</h5>
                    </div>
                  
                </div>
                 <input type="hidden" id="replysize" name="replysize" value="${fn:length(counselingReplyList)}">
                 
                 
                 <c:if test="${counselingPrnts.avlblEndDt == 9999 }"	>
                <form class="reply-form" id="reply-form" name="reply-form" onsubmit="counselingreplyinsert();">
                	<input type="hidden" id="authUser" name="authUser" value="${authUser.mbNo }">
					<input type="hidden" id="prntsWrtbtNo" name="prntsWrtbtNo" value="${counselingPrnts.wrtbtNo }">
					 <input type="hidden" id="bbsNo" name="bbsNo" value="${counselingPrnts.bbsNo}"> <br>
					 
                    <textarea class="w3-input w3-border w3-border-grey w3-margin-bottom w3-large" placeholder="Answers..." id="wrtbtText2" name="wrtbtText"></textarea>
                    
                    <select id="writrInfoOpngYn" class="hide">
	           		
					  <option  class="hide" value="Y" selected="selected"></option>
					  <option value="N">비공개로 작성하기</option>
					</select>
					
                    <button type="submit" id="myBtns" class="w3-button w3-right w3-margin-bottom w3-block w3-round-large w3-blue">답변하기</button>
              
              
                </form>
                </c:if>	
                
                
            </div>
            <!--질문 끝-->
        </div>
    </div>
</div>
</div>

<div class="w3-row answers">
<div class="w3-container">
    <div class="w3-content" style="max-width: 768px;">
    
   
   			 <c:if test="${fn:length(counselingReplyList) > 0  }"	> 
           
                    <div class="w3-panel w3-border-bottom w3-border-black">
			            <h4>
			                <div style="float: left; margin-right: 0.3em;">답변</div>
			            </h4>
			        	</div>
               </c:if> 
    		
    
    	      <c:forEach items="${counselingReplyList}" var="counselingReplyList" varStatus="status">
            	
            	
            	    <div class="w3-white w3-border w3-border-grey w3-margin-bottom">

			            <div class="w3-padding w3-text-grey w3-large">
			                <button class="w3-button">
			                        <span class="fa-layers fa-fw" style="font-size: 1.2em;">
			                             <i class="fal fa-thumbtack"></i>
			                        </span>
			                </button>
			                <span class="w3-lobster"> #${status.index+1}</span>
			            </div>
			            <div class="w3-container">
			                <h6> ${counselingReplyList.nknm} <span class="w3-text-grey">•${counselingReplyList.avlblBeginDt}에 작성</span></h6>
			            </div>
			            <div class="w3-container w3-white" style="line-height: 200%">
			            
			            	<c:if test="${counselingReplyList.avlblEndDt == 9999 }"	>
			                <p class="w3-padding">
			                ${fn:replace(counselingReplyList.wrtbtText, newLine,"<br>") }
			                </p>
							</c:if>
							<c:if test="${counselingReplyList.avlblEndDt != 9999 }"	>
							 <p class="w3-padding">
			               	사용자에 의해 삭제된 게시물입니다.
			                </p>

							</c:if>
			
				
			                <div class="w3-container w3-bar w3-padding">
			                    <button class="w3-button like${counselingReplyList.wrtbtNo }like" onclick="likeupdate(${counselingReplyList.wrtbtNo },'like')" value="like">
			                        <span class="fa-layers fa-fw" style="font-size: 2.5em;">
			                            <i class="fal fa-thumbs-up"></i><span class="fa-layers-counter fa-layers-bottom-right like${counselingReplyList.wrtbtNo }likes">${counselingReplyList.rcmdCo }</span>
			                        </span>
			                    </button>
			                    <button class="w3-button like${counselingReplyList.wrtbtNo }dislike" onclick="likeupdate(${counselingReplyList.wrtbtNo },'dislike')" value="dislike">
			                        <span class="fa-layers fa-fw" style="font-size: 2.5em;">
			                            <i class="fal fa-thumbs-down"></i><span class="fa-layers-counter fa-layers-bottom-right like${counselingReplyList.wrtbtNo }dislikes">${counselingReplyList.ncmdCo }</span>
			                        </span>
			                     </button>
			                     
			                    <c:if test="${ authUser.mbNo ==counselingReplyList.mbNo && counselingReplyList.avlblEndDt == 9999}"	>
			                                   	
			                 	<button class="w3-button w3-right" onclick="deletecoun(${counselingReplyList.wrtbtNo })" >
		                        <span class="fa-layers fa-fw" style="font-size: 2.5em;">
		                        <i class="fal fa-times"></i>
		                        </span>
		                  	  </button>                   	
			             		</c:if>
			                    
			                </div>
			            </div>
			        </div>
            
		
			</c:forEach>

    </div>
</div>
</div>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/doscrap.js"></script>	



</body>
</html>