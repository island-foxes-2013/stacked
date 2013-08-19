$(document).ready(function(){
	isotopeInteractions();
});

function isotopeInteractions() {
	// cache container
	var $container = $('#container');

	// Card Sort Data
	var sortData = {
		updated_at : function ( $elem ) {
	    return parseInt( $elem.find('.updated-at-value').text(), 10 );
	  },
	  name : function ( $elem ) {
	    return $elem.find('.name').text();
  	}
	}

	// initialize isotope
	$container.isotope({
    itemSelector  : '.card-wrapper',
    layoutMode    : 'masonry',
    getSortData		:  sortData
  })

	// filter items when filter link is clicked
	$('#filter-by').find("a").click(function(){
		console.log("inside filter")
	  var selector = $(this).attr('data-filter');
	  $container.isotope({ filter: selector });
	  return false;
	});

	$('#sort-by').find('a').click(function(){
	  // get href attribute, minus the '#'
	  var sortName = $(this).attr('href').slice(1);
	  console.log("sorting by "+sortName);
	  $('#container').isotope({ sortBy : sortName });
	  return false;
	});

}