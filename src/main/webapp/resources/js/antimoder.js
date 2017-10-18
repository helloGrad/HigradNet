$(function() {


	var img = $('.anti');
	if(img!=null){
		for(var i=0;i<img.length;i++){
			AntiModerate.process(img[i], img[i].getAttribute("data-antimoderate-idata"));	
		}

	}
});