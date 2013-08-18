// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
	$('.board-edit').on('click', function(){
		$('.inline-edit').slideToggle();
		$('.delete').slideToggle();
		$('.last').slideToggle();
	});
});