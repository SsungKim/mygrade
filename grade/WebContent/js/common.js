//$(document).ready(function(){
	// 개발자도구 방지
//	$(document).keyup(function(e){
//		if(e.keyCode == 123){
//			alert("보안상의 이유로 개발자도구를 열 수 없습니다.");
//			return false;
//		}
//	});
//});

$(document).ready(function(){
    
    $(".hmenubar").click(function(){
    	var window_width = $(window).width();
        $(".hmenubar").css("display","none");
        if(window_width >= 1300){
        	$(".gnb_wrap").stop().animate({
        		left: 0
        	});
        } else {
        	$(".gnb_wrap1").stop().animate({
        		left: 0
        	});
        }
    });
});

$(document).ready(function(){
    
    $(".gnb_close .img img").click(function(){
        $(".hmenubar").css("display","block");
        $(".gnb_wrap").stop().animate({
            left: -1191
        });
    });
});


//$(document).ready(function(){ 
//    var fileTarget = $('.upload_hidden');
//    
//    fileTarget.on('change', function(){ 
//        if(window.FileReader){ 
//            var filename = $(this)[0].files[0].name;
//        } else { 
//            var filename = $(this).val().split('/').pop().split('\\').pop(); 
//        } 
//        $(this).siblings('.upload_name').val(filename); 
//    }); 
//}); 

$(document).ready(function(){
                 
    var sn = 0;

    $(".di_arrow_next").click(function(){
        sn++;
        $(".di_slider_inner").stop().animate({
            left: -309 * sn
        });
    });

    $(".di_arrow_prev").click(function(){
        sn--;
        $(".di_slider_inner").stop().animate({
            left: -309 * sn
        });
    });
});

$(document).ready(function(){
                 
    var sn = 0;

    $(".di_arrow_next").click(function(){
        sn++;
        $(".di_slider_inner").stop().animate({
            left: -309 * sn
        });
    });

    $(".di_arrow_prev").click(function(){
        sn--;
        $(".di_slider_inner").stop().animate({
            left: -309 * sn
        });
    });
});

$(document).ready(function(){
                 
    var sn = 0;

    $(".item_arrow_next").click(function(){
        sn++;
        $(".item_slider_inner").stop().animate({
            left: -218 * sn
        });
    });

    $(".item_arrow_prev").click(function(){
        sn--;
        $(".item_slider_inner").stop().animate({
            left: -218 * sn
        });
    });
});

$(document).ready(function(){
                 
    var sn = 0;

    $(".item_arrow_next1").click(function(){
        sn++;
        $(".item_slider_inner1").stop().animate({
            left: -218 * sn
        });
    });

    $(".item_arrow_prev1").click(function(){
        sn--;
        $(".item_slider_inner1").stop().animate({
            left: -218 * sn
        });
    });
});

$(document).ready(function(){
                 
    var sn = 0;

    $(".item_arrow_next2").click(function(){
        sn++;
        $(".item_slider_inner2").stop().animate({
            left: -218 * sn
        });
    });

    $(".item_arrow_prev2").click(function(){
        sn--;
        $(".item_slider_inner2").stop().animate({
            left: -218 * sn
        });
    });
});

$(document).ready(function(){
    
    $(".myinfo .section01 .info_wrap1 .info_tit #modify").click(function(){
        $("#bank01").css("display","none");
        $("#bank02").css("display","block");
    });
});

$(document).ready(function(){
    
    $(".pop_close").click(function(){
        $(".info_popup_wrap").css("display","none");
    });
});

function mbheader_click(){
    var x = document.getElementById("mb_contents");
    if ( x.className.indexOf("mb_contents_on") == -1 ) {
        x.className += " mb_contents_on";
    } else {
        x.className = x.className.replace(" mb_contents_on", "");
    }
}

function mbtnTit01(){
    var x = document.getElementById("mbtnTxt01");
    if ( x.className.indexOf("txt_wrap_on") == -1 ) {
        $("#mbtnTit01").css("background-image","url(../img/main/mminus.png)")
        x.className += " txt_wrap_on";
    } else {
        x.className = x.className.replace(" txt_wrap_on", "");
        $("#mbtnTit01").css("background-image","url(../img/main/mplust.png)")
    }
}

function mbtnTit02(){
    var x = document.getElementById("mbtnTxt02");
    if ( x.className.indexOf("txt_wrap_on") == -1 ) {
        $("#mbtnTit02").css("background-image","url(../img/main/mminus.png)")
        x.className += " txt_wrap_on";
    } else {
        x.className = x.className.replace(" txt_wrap_on", "");
        $("#mbtnTit02").css("background-image","url(../img/main/mplust.png)")
    }
}

function aaa(elem){
    if(event.keyCode == 13){
        var h = $(elem)[0].clientHeight;
        $(elem).css("height", h-18+"px");
    }
}

