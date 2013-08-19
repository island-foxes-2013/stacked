
// function loadCards(){
//   var windowSize = $(window).width();
//   // console.log(windowSize);

//   if (windowSize <= 500){
//     // $('.flip').removeClass().addClass('flip large-10 columns');
//     $('.flip').css('width', '100%')
//   }
//   else if (windowSize <= 767){
//     // $('.flip').removeClass().addClass('flip small-5 columns');
//     $('.flip').css('width', '47%')
//   }
//   else if (windowSize <= 1000){
//     // $('.flip').removeClass().addClass('flip large-4 columns');
//     $('.flip').css('width', '30%')
//   }
//   else if (windowSize <= 1500){
//     // $('.flip').removeClass().addClass('flip large-3 columns');
//     $('.flip').css('width', '23%')
//   }
//   else if (windowSize > 1500) {
//     // $('.flip').removeClass().addClass('flip large-2 columns');
//     $('.flip').css('width', '18%')
//   }
// }

function tweet(tweet){
  return tweetFormat(tweet.tweet_id, tweet.text, tweet.user_id)
}

function tweetFormat(tweet_id, text, user_id) {
  return "<div class='tweet'>"+
            "<div class='content'>" +
              text +
            "</div>" +
            "<a href='https://twitter.com/"+user_id+"/statuses/"+tweet_id+"'>"+
              "<img alt='t' src='/assets/nottwittersbird.png'>" +
            "</a>"+
          "</div>"
}

function instaFormat(instagram) {
  var $post = $(".templates").find(".image_post");
  $post.find(".content").text(instagram.text);
  $post.find(".source").find("img").attr("src");
  return $post;
}

// function tweetPicture(tweet_id, content, picUrl) {
//   return "<div class='tweet'>"+
//             "<img border='0' src='http://i.stack.imgur.com/skvx1.png' width='200' height='200'>" +
//             "<div class='content'>" +
//               content +
//             "</div>" +
//           "</div>"
// }

function handleExternalLinks() {
 $("a[href^=http]").each(function(){
    if(this.href.indexOf(location.hostname) == -1) {
       $(this).attr({
          target: "_blank",
          title: "Opens in a new window"
       });
    }
 });
}

function makeCardsDraggable() {
  $(".card").find(".header").draggable({
    helper    : function(e){

      var $card = $(e.target);
      var $dragBuddy = $('.dragged-card').clone();

      var imgUrl = $card.find('.mini-pic').attr('id').toString();
      var cardId = $card.closest('.card').attr("id");

      $dragBuddy.find('.name').text($card.find('.name').text());

      $dragBuddy.find('.profile-pic').attr('src',imgUrl);
      $dragBuddy.attr("id",cardId);

      // console.log($dragBuddy);
      return $dragBuddy[0];
    },
    cursor    : 'move',
    cursorAt  : { left : 5 },
    appendTo  : 'body',
    zIndex    : 999
  });
}

function makeDecksDroppable() {
  $(".board-link").droppable({
    drop        : addCardToDeck,
    hoverClass  : 'drop-hover'
  })
}

function addCardToDeck(event,ui) {
  var card = ui.draggable.closest('.card');
  console.log(card);
  var board = $(this);
  console.log( 'The square with ID "' + card.attr('id') + '" was dropped onto ' + board.attr('id'));
  $.ajax({
    url: '/board_cards',
    method: 'post',
    data: {board_slug: board.attr('id'), card_slug: card.attr('id')}
  }).done(function(data) {
    console.log(data)
  })
}

function writtenTime(epoch){
  var months = ['Jan','Feb','Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec'];
  var now = Math.floor(new Date()/1000);
  var timeAgo = now - (epoch-3);
  if (timeAgo < 0){
    return 'the future';
  }
  if (timeAgo < 2419000) {
    return makeItLookNice(timeAgo); //
  }
  else {
    actualDate = new Date(epoch*1000);
    if (timeAgo < 31557600) {
      return (actualDate.getDay() +", "+ months[actualDate.getMonth()]);
    } 
    else {
      return (months[actualDate.getMonth()] +" "+actualDate.getFullYear());
    }
  }
}

function makeItLookNice(seconds){
  var times = [1,60,60,24,7,52]
  var labels = ['s','m','h','d','w','y']
  var i = 0;
  while (seconds/times[i] >= 1){
    seconds = seconds/times[i]
    i++;
  }
  return (String(Math.floor(seconds))+labels[i-1])
}

function recentTimeParse(time){
  //2013-07-31T15:26:49-07:00 
  var datetime = time.split("T");
  var date = datetime[0].split('-');
  var time = datetime[1].split('-')[0].split(':');
  console.log(new Date(date[0],date[1],date[2],time[0],time[1],time[2]));
  objectDate = Math.floor(new Date(date[0],date[1]-1,date[2],time[0],time[1],time[2])/1000);
  return objectDate;
}

// DOCUMENT READY!
$(document).ready(function() {
  // $('.frosty').blurjs({
  //   source: 'body',
  //   radius: 10,
  //   overlay: 'rgba(255,255,255,0.4)'
  // });

  // $(document).on('mouseover','.flip', function(){
  //   $(this).find('.card').addClass('flipped').mouseleave(function(){
  //       $(this).removeClass('flipped');
  //   });
  //   return false;
  // });

  $('.update-twitter').on("ajax:success", function(event, xhr, status, error){
    var htmlString = ''
    var updatedTime;
    for (i in xhr) {
      if (i == 0){
        updatedTime = recentTimeParse(xhr[i].created);
      }
      htmlString += tweet(xhr[i])
    }
    $cardBack = $(this).closest('.face.back');
    $cardBack.find('.updated-at-value').html(updatedTime);
    $cardBack.find('.last').html(writtenTime(updatedTime));
    console.log(writtenTime(updatedTime));
    $cardBack.find('.news').append(htmlString);
    $(this).closest('.card').addClass('flipped');
    handleExternalLinks();
  });

  $('.update-twitter').on("ajax:error", function(event, xhr, status, error){
    console.log('errrrrrrorr')
    $(this).closest('.card').addClass('flipped');
    handleExternalLinks();
  });

  $(document).on('ajax:success','.delete', function(event, xhr, status, error) {
    console.log(event)
    $('#container').isotope('remove', $(event.target).closest('.card-wrapper'));
    // $(this).closest('.flip').fadeOut('slow');  
  });

  $('.update-twitter').click();

  $(window).resize(function() {
    // loadCards();
    // $('.card').addClass('flipped');
    makeCardsDraggable();
    makeDecksDroppable();
    $('.flip').fadeIn(600);
  });

});


