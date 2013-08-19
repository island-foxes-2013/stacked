$(document).ready(function(){
	isotopeInteractions();
})

function isotopeInteractions() {
	// cache container
	var $container = $('#container');
	// initialize isotope
	$container.isotope({
    itemSelector  : '.card-wrapper',
    layoutMode    : 'fitRows'
  })

	// filter items when filter link is clicked
	$('#card-filters').find("a").click(function(){
		console.log("inside filter")
	  var selector = $(this).attr('data-filter');
	  $container.isotope({ filter: selector });
	  return false;
	});


}