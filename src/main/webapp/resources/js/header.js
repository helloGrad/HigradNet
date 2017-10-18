var boardtype;


$(function(){
	   
	   

	   window.addEventListener('click',handler,false);



	   window.addEventListener('touchstart',handler,false);
	   
	   //window.onclick = function(e) {

	   
	   //}
	   
	   


	})

	function handler(e){
	   
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





	
	$(document).keydown(function(e) {
		if (e.keyCode == 27) {
			closeRegister();
			closeLogin();
			closeMenu();
			closeSearch();
		}
	});
	
	function goToRegiter(){
		closeLogin();
		registerForm();
	}
	
	function goToLogin(){
		closeRegister();
		loginForm();
	}
	function initSignupModal() {
		$("#nknmcheck").removeClass("oninput");
		$("#nknmcheck").empty();
		$("#idencheck").removeClass("oninput");
		$("#idencheck").empty();
		$("#pwcheck").removeClass("oninput");
		$("#pwcheck").empty();
	//	$("#pwcheck2").removeClass("oninput");
	//	$("#pwcheck2").empty();
		$("#nickname").val('');
		$("#remail").val('');
		$("#rpwd").val('');
		$("#rpwd_again").val('');
		$("#birthyn").val('');
		$("#radiomale").prop("checked", true);
		$(".genderlabel").removeClass("on-gender");
		$("#M").addClass("on-gender");
		$("#birthy").val('');
		$("#selectm").prop("selected", true);
		$("#selectd").prop("selected", true);
		$("#rpwd").attr("type", "text"); 
	}
	function initLoginModal() {
		$("#emailMsg").empty();
		$("#passwdMsg").empty();
		$("#loginMsg").empty();
		$("#email").val('');
		$("#pwd").val('');
	}
	// 메뉴 닫기 end