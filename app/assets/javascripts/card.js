$(document).ready(function() {
	$(document).on('mouseover','.card', function(){
    $(document).find('.card').addClass('flipped').mouseleave(function(){
        $(this).removeClass('flipped');
    });
    return false;
	});
});

