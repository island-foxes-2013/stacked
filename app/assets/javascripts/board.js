// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
	$('.board-edit').on('click', function(){
		$('.inline-edit').slideToggle();
		$('.delete').slideToggle();
		$('.last').slideToggle();
		$('.updates').toggle();
	});


	var swapFollowLink = function(e, link) {
		$(this).remove();
		link = $(link).hide();
		$('.board_actions').append(link);
		link.fadeIn();
	}

	$('.board_actions').on('ajax:success', '.follow', swapFollowLink);
	$('.board_actions').on('ajax:success', '.unfollow', swapFollowLink);

	$('dd a').click(function() {
		$link = $(this);
		$link.closest('dl').find('dd').removeClass('active');
		$link.closest('dd').addClass('active');
	})

	// $('dd').mouseover(function() {
	// 	$button = $(this);
	// 	$button.addClass('active');
	// })

	// $('dd').mouseout(function() {
	// 	$button = $(this);
	// 	$button.removeClass('active');
	// })
});