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
});

