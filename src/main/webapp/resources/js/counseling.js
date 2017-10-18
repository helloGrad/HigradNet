
	var bbsNo;
	var test;
	var order; 
	var boardtype;
	var count=0;
	var totalListNum = 0;
	var ttype;
	var type;


	var isEnd = false;

	var dislistItemTemplate = new EJS({	url : "/net/resources/js/ejs-template/discussion-list-item.ejs"});
	var dislistTemplate = new EJS({	url : "/net/resources/js/ejs-template/discussion-list.ejs"});
	//var counlistItemTemplate = new EJS({	url : "/net/resources/js/ejs-template/counseling-list-item.ejs"});
	//var counlistTemplate = new EJS({	url : "/net/resources/js/ejs-template/counseling-list.ejs"});	
	var pagelistTemplate = new EJS({url : "/net/resources/js/ejs-template/page-list.ejs"});
	var disbFetching = false;
	
	
$(function() {

		
		
		var authUser = $("#authUser").val();

		/*
		
		window.onclick = function(e) {

			if (e.target == document.getElementById("registerForm")) {
				closeRegister();
				initSignupModal();
			}
			if (e.target == document.getElementById("loginForm")) {
				closeLogin();
				initLoginModal();
			}

			 if (e.target == document.getElementById("writeModal")) {
			        closeMenu();
			        initLoginModal();
			    }
			if (e.target == document.getElementById("searchForm")) {
				closeSearch();
			}
		}
		
		*/
		$(document).ready(function() {
			
			

			$("#cfile").click(function () {
				
					
				  $("input[type='file']").trigger('click');
				});

				$('input[type="file"]').on('change', function() {
				  var val = $(this).val();
				  $(this).siblings('span').text(val);
			});
				


		});
			

		/*
		$('.setting').on('click',function(){
			
    		if(authUser=='undefined'||authUser == null || authUser == "" ){
    			
    			$('#loginForm').css('display','block');
    		}else{
    			
    			location.href='/net/user/setting'
    		}
    	})
   
    	
    	$('.myscrap').on('click',function(){
    		if(authUser=='undefined'|| authUser == null || authUser == "" ){
    			$('#loginForm').css('display','block');
    		}else{
    			location.href='/net/user/mypage?type=myscrap'
    		}
    	})
		*/
    	
    	$('.doScrap').on('click',function(){
    		if(authUser=='undefined'|| authUser == null || authUser == "" ){
    			$('#loginForm').css('display','block');
    		}
    	})
    	
    
    	
		/*
		$('#writrInfoOpngYn2 li > a').on('click', function() { 
			
			 document.getElementById("writrInfoOpngYn").innerHTML = 
				 
				 "<option  class='hide' value='Y'></option>"+
				  "<option value='N' selected='selected'>비공개로 작성하기</option>";
		});
*/
		
		
		$(document).keydown(function(e) { 
			

			  var modal1 = document.getElementById('writeModal');
		    if (e.keyCode == 27) { 
		    	
				   modal1.style.display = "none";
		    } 
		});
		
		

	})
	
	
	function setting(authUser) {
		
		
		if(authUser=='undefined'|| authUser == null || authUser == "" ){
			$('#loginForm').css('display','block');
		}else{
			location.href='/net/user/setting'
		}
		
	}
	
	function myscrap(authUser) {
		
		
		if(authUser=='undefined'|| authUser == null || authUser == "" ){
			$('#loginForm').css('display','block');
		}else{
			location.href='/net/user/mypage?type=myscrap'
		}
		
	}
	
	function mypage(authUser) {
		
		
		if(authUser=='undefined'|| authUser == null || authUser == "" ){
			$('#loginForm').css('display','block');
		}else{
			location.href='/net/user/mypage'
		}
		
	}
	 	    	
	
	function closeMenu() {
		document.getElementById("writeModal").style.display = "none";
	}
	//글쓰기 폼 end
	//로그인 메뉴
	function loginForm() {
		document.getElementById("loginForm").style.display = "block";
	}
	function closeLogin() {
		document.getElementById("loginForm").style.display = "none";
		initLoginModal();
	}
	//로그인 메뉴 end
	//회원가입 메뉴
	function registerForm() {
		document.getElementById("registerForm").style.display = "block";
	}
	function closeRegister() {
		document.getElementById("registerForm").style.display = "none";
		initSignupModal();
	}
	//회원가입 메뉴 end
	//서치 메뉴
	function searchForm() {
		document.getElementById("searchForm").style.display = "block";
	}
	function closeSearch() {
		document.getElementById("searchForm").style.display = "none";
	}
	//서치 메뉴 end
	// 메뉴 닫기
		//사이드 메뉴
	function openRightMenu() {
		document.getElementById("rightMenu").style.display = "block";
	}
	function closeRightMenu() {
		document.getElementById("rightMenu").style.display = "none";
	}

	
	function wrightMenu(authUser, type) {
		
	
		
		if (authUser === null || authUser === '' || authUser === undefined) {
			
			loginForm();

		} else {
			
			$("#boardoption").val(type).attr("selected", "selected");
			
			

			document.getElementById("writeModal").style.display = "block";
			
		}
		
	}
	
	function reset(type,order1){
		
		
		
		
		$("#Demo").removeClass("w3-show")
		
		
		
		if(totalListNum >= 20){
			pageList(type, order1, '1' , '' , ttype);
		}
		else {
		$("#list").empty();
	
		
		order=order1;
		 isEnd=false;
		 disfetchList(type,order,ttype);
		 totalListNum = 0;
		}
		 
	}
	
	
	var disfetchList = function(type,order, ttype, callback) {
			
		if (isEnd === true) {
			return;
		}
		
		var startNo;
		var startNo2; 
		var user = 	$("#authUser").val();
		
			
		if(type == '전체') {
			startNo = $("#list .w3-card:last-child").find('input').val() || 0;
			
		}else{
			
			startNo = $("#list .w3-card:last-child").find('input').val() || 0;
			
		}

		
		$.ajax({
			url : "/net/counseling/api/list?sno="+startNo+"&type="+type+"&order="+order+"&ttype="+ttype,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
			test=response.data;
			

				if (response.result === "fail") {
					console.warn(response.message);
					return;
				}

				if (response.data.counselingList.length < 5) {
					isEnd = true;
				}
				var ttype2 = ttype;
				$.each(response.data.counselingList, function(index, vo) {
					
					
					
					
					vo.user = user;
					disrender(type, vo);
					totalListNum++;
					if (totalListNum >= 20) {
						isEnd = true;
						pageList(type, order, '1', 'init', ttype2);
					}
				});
				
				

				disbFetching = false;
			
				if (typeof(callback) == "function") callback();
				
				
			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
				disbFetching = false;
			}
		});

	}
	

	var disrender = function(type,vo, mode) {
		var html;

		if(type==='전체'){
			html = dislistItemTemplate.render(vo);
		}
		else{
			
			html = dislistItemTemplate.render(vo);
			
		}

		if (mode === true) {
			$("#list").prepend(html);
		} else {
			$("#list").append(html);
			
		}

	}


	var pageList = function(type, order, page, check, ttype) {


		var user = 	$("#authUser").val();
		
		
		$.ajax({
			url : "/net/counseling/api/pagelist?page=" + page + "&type=" + type
					+ "&order=" + order + "&user=" + user + "&ttype=" + ttype,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {

				if (response.result === "fail") {
					console.warn(response.message);
					return;
				}

				var vo;

				vo = response.data;
				vo.type = type;
				vo.order = order;
				vo.check = check;
				vo.user = user;
				vo.ttype=ttype;

				pageListrender(type, vo);

			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
			}
		});

	}


	var pageListrender = function(type, vo, mode) {
		var html;
		var listhtml;
		

		html = pagelistTemplate.render(vo);

		if (vo.check != 'init') {
			if (type === '전체') {
				listhtml = dislistTemplate.render(vo);
			} else {
				listhtml = dislistTemplate.render(vo);
			}
		}

		$("#list").html(listhtml);
		$("#pagelist").html(html);
		

		for(var i=0;i<vo.scrapList.length;i++){
			if(vo.scrapList[i].prntsDstnct==='게시글'){ //게시글
				$('.do-scrapcoun' + vo.scrapList[i].prntsNo).addClass('scrap-on');
			}
		};

	}

	function changeColor(obj) {

		
	   $(".objectbutton1").removeClass("on");
	   $(".objectbutton2").removeClass("on");
	   
	   if(obj.value == "일반게시판"){
		   
		   $(".objectbutton2").addClass("on");
		  
		   
	   }else{
		   
		   $(".objectbutton1").addClass("on");
		  
	   }	   
	}
	

	
	
	function resize(obj) {
			

			 obj.style.height = "1px";
			 obj.style.height = (12+obj.scrollHeight)+"px";
			
			 $("#writeModal").scrollTop($("#writeModal")[0].scrollHeight);


	}
	

	function titleResize(obj) {

		obj.style.height = "1px";

		obj.style.height = (20 + obj.scrollHeight) + "px";

	}


	function counselinginsert() {

		
		
		 var formData = new FormData($("#counselingform")[0]);

		 
		var boardoption=$("#boardoption").val();
		 
		 var writrInfoOpngYn = $("#writrInfoOpngYn").val();
		
		
		formData.append('writrInfoOpngYn', writrInfoOpngYn);
		

		$("#writeModal").css({
			"display" : "none"
		});

		
		$.ajax({
			url : "/net/counseling/api/write",
			type : "post",
			data : formData,
			processData : false,
            contentType : false,


			success : function(response) {

				if (response.result === "fail") {

					console.error(response.message);
					return;
				}

				
				location.reload();

			},
			error : function(jqXHR, status, e) {
				
				console.error(status + " : " + e);
			}
		});
		
		
		

	}
	

	
	
	

