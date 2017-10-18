
var doScrap = function(type, id,  isdetail, user) {
	


	if (user === undefined || user ==null || user =='' ) {

		$("#loginForm").css({
			"display" : "block"
		});

		return;
		
		
	} else {

		var classType;
		if (type === '모집공고') {
			classType = 'noti';
		} else if (type === '게시글') {
			classType = 'coun';
		}
		

		if ($('.do-scrap' + classType + id).hasClass("w3-text-red")) {
			


			
			$('.do-scrap' + classType + id).removeClass("w3-text-red");
			$('.scrap' + classType + id).removeClass('grad-banner');
			$('.scrap' + classType + id).addClass('w3-card');
		

			$.ajax({
				url : "/net/api/deletescrap?type=" + type + "&id=" + id
						+ "&user=" + user,
				type : "get",
				dataType : "json",
				data : "",
				success : function(response) {
				

					if (response.result === "fail") {
						console.warn(response.message);
						return;
					}
					else if(isdetail === 'y'){
						$("#notiDetailCount").text(response.data);
						$("#notiDetailCountIcon").text(response.data);
					}
					
					$.ajax({
						url : "/net/api/scrapCount?&user="
								+ user,
						type : "get",
						//dataType : "json",
						data : "",
						success : function(response) {
							
							 
							$('.mainscrap').text(response.data +" 스크랩");

							if (response.result === "fail") {
								console.warn(response.message);
								return;
							}

						},
						error : function(jqXHR, status, e) {
							console.error(status + " : " + e);
						}
					});

				},
				error : function(jqXHR, status, e) {
					console.error(status + " : " + e);
				}
			});
		} else {
			$('.do-scrap' + classType + id).addClass("w3-text-red");
			$('.scrap' + classType + id).addClass('grad-banner');
			$('.scrap' + classType + id).removeClass('w3-card');
		


			$.ajax({
				url : "/net/api/addscrap?type=" + type + "&id=" + id + "&user="
						+ user,
				type : "get",
				dataType : "json",
				data : "",
				success : function(response) {
				

					if (response.result === "fail") {
						console.warn(response.message);
						return;
					}
					else if(isdetail === 'y'){
						$("#notiDetailCount").text(response.data);
						$("#notiDetailCountIcon").text(response.data);
						
					}
					
					$.ajax({
						url : "/net/api/scrapCount?&user="
								+ user,
						type : "get",
						//dataType : "json",
						data : "",
						success : function(response) {
							
							$('.mainscrap').text(response.data +" 스크랩");

							if (response.result === "fail") {
								console.warn(response.message);
								return;
							}

						},
						error : function(jqXHR, status, e) {
							console.error(status + " : " + e);
						}
					});

				},
				error : function(jqXHR, status, e) {
					console.error(status + " : " + e);
				}
			});
		}
		
		///
	
		
		
		
		
	}

}




var deleteScrap = function(type, id, user) {
	
	
	$.ajax({
		url : "/net/api/deletescrap?type=" + type + "&id=" + id
				+ "&user=" + user,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
		

			if (response.result === "fail") {
				console.warn(response.message);
				return;
			}

			if(type==='모집공고'){
				$("#scrapnoti"+id).remove();
			}
			else if(type==='게시글'){
				$("#scrapcoun"+id).remove();
			}
			
			

		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
		}
	});
	
}