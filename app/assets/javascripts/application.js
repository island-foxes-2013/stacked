// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.draggable
//= require jquery.ui.droppable
//= require jquery_ujs
//= require foundation

//= require foundation/foundation
//= require foundation/foundation.alerts
//= require foundation/foundation.clearing
//= require foundation/foundation.cookie
//= require foundation/foundation.dropdown
//= require foundation/foundation.forms
//= require foundation/foundation.joyride
//= require foundation/foundation.magellan
//= require foundation/foundation.orbit
//= require foundation/foundation.reveal
//= require foundation/foundation.section
//= require foundation/foundation.tooltips
//= require foundation/foundation.topbar
//= require foundation/foundation.interchange
//= require foundation/foundation.placeholder
//= require foundation/foundation.abide

//= require_tree .

function lookup(searchtext) {
   if(searchtext.length == 0) {
      $('#suggestions').hide(); // Hide the suggestions box
   } 
   else {
      $.post("/search/global", {q: '' + searchtext + ''}, function(data) { // Do an AJAX call
         $('#suggestions').show(); // Show the suggestions box
         $('#suggestions').html(data); // Fill the suggestions box
      });
  }
}

$(document).ready(function(){ 
  $(document).foundation(); 

  $('#searchtext').on('keyup', function(){
    lookup( $(this).val() );
  });

});
