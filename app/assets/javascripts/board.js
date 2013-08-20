// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
	$('.board-edit').on('click', function(){
		$('.inline-edit').slideToggle();
		$('.delete').slideToggle();
		$('.last').slideToggle();
		$('.updates').toggle();
	});

	$('.follow').on('ajax:success', function(){
		console.log('follow');
		$(this).hide();
		$('.unfollow').fadeIn();
	});

	$('.unfollow').on('ajax:success', function(){
		console.log('unfollow');
		$(this).hide();
		$('.follow').fadeIn();
	});

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