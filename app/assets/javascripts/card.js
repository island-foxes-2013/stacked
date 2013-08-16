$(document).ready(function() {
	$(document).on('mouseover','.flip', function(){
    $(this).find('.card').addClass('flipped').mouseleave(function(){
        $(this).removeClass('flipped');
    });
    return false;
	});

	$(document).on('click','.card.flipped',function(){
		var hgt_string = $(this).css('height');
		var	hgt = parseInt(hgt_string.slice(0,hgt_string.length-2))
		// $(this).parent().append($(this));
		// $(this).css('height', String(hgt*2)+'px');
	});

	$(window).resize(function() {
	  var windowSize = $(window).width();
	  console.log(windowSize);

	  if (windowSize <= 400){
	  	$('.flip').removeClass().addClass('flip large-10 columns');
	  }
	  else if (windowSize <= 767){
	  	$('.flip').removeClass().addClass('flip large-1 columns');
	  }
	  else if (windowSize <= 1000){
	  	$('.flip').removeClass().addClass('flip large-4 columns');
	  }
	  else if (windowSize <= 1200){
	  	$('.flip').removeClass().addClass('flip large-3 columns');
	  }
	});
});

