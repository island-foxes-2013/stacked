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
      ).css('position', 'relative');
  });

  $(window).resize(function() {
    loadCards();
    $('.flip').fadeIn(600);
    $('.card').addClass('flipped');
  });
});


function loadCards(){
  var windowSize = $(window).width();
  console.log(windowSize);

  if (windowSize <= 500){
    // $('.flip').removeClass().addClass('flip large-10 columns');
    $('.flip').css('width', '100%')
  }
  else if (windowSize <= 767){
    // $('.flip').removeClass().addClass('flip small-5 columns');
    $('.flip').css('width', '47%')
  }
  else if (windowSize <= 1000){
    // $('.flip').removeClass().addClass('flip large-4 columns');
    $('.flip').css('width', '30%')
  }
  else if (windowSize <= 1500){
    // $('.flip').removeClass().addClass('flip large-3 columns');
    $('.flip').css('width', '23%')
  }
  else if (windowSize > 1500) {
    // $('.flip').removeClass().addClass('flip large-2 columns');
    $('.flip').css('width', '18%')
  }
}




