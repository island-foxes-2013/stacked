$(document).ready(function() {
  // $(document).on('mouseover','.flip', function(){
  //   $(this).find('.card').addClass('flipped').mouseleave(function(){
  //       $(this).removeClass('flipped');
  //   });
  //   return false;
  // });

    
  

  $(document).on('click','.card.flipped',function(){
    console.log(this);
    var handle = '@CrabCaker'
    var content = 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Pellentesque in erat cras amet.'
    $(this).find('.face.back').append(
      "<div class='tweet'>"+
        "<span>"+handle+"</span>" + 
        "<div class='content'>" +
          content +
        "</div>" +
      "</div>"
      );
  });

  $(window).resize(function() {
    //loadCards();
    $('.flip').fadeIn(600);
    $('.card').addClass('flipped');
  });
});


// function loadCards(){
//   var windowSize = $(window).width();
//   console.log(windowSize);

//   // if (windowSize <= 666){
//   //   $('.flip').removeClass().addClass('flip large-10 columns');
//   // }
//   // else if (windowSize <= 767){
//   //   $('.flip').removeClass().addClass('flip small-5 columns');
//   // }
//   // else if (windowSize <= 1000){
//   //   $('.flip').removeClass().addClass('flip large-4 columns');
//   // }
//   // else if (windowSize <= 1500){
//   //   $('.flip').removeClass().addClass('flip large-3 columns');
//   // }
//   // else if (windowSize > 1500) {
//   //   $('.flip').removeClass().addClass('flip large-2 columns');
//   // }
// }




