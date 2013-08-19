var TweetFormat = {
  new: function(tweet) {
    var $post = $(".templates").find(".text-post");
    $post.find(".content").html(tweet.text);
    $post.find("a").attr("href", "https://twitter.com/"+tweet.user_id+"/statuses/"+tweet.tweet_id);
    // TODO-JW: We shouldn't have to return .html() here.
    return $post.html();
  }
};

var InstaFormat = {
  new: function(instagram) {
    var $post = $(".templates").find(".image-post");
    $post.find(".content").text(instagram.text);
    $post.find(".source").find("img").attr("src");
    return $post;
  }
};

var AddACard = {
  init: function() {
    
    $("#add-card").click(function(){
      console.log("in flip card");
      $card = $(this);
      $card.addClass('flipped');
      console.log($("#add-card.flipped"));
    });
    // $(".container").on('click', $("#add-card.flipped"), function(e){
    //   console.log("in unflip card");
    //   $card = $("#add-card.flipped");
    //   $card.removeClass('flipped');
    // });
  }
}

var LazyLoader = {
  init: function() {
    var self = this;

    $('.update-twitter').on("ajax:success", function(event, xhr, status, error){
      console.log(xhr)
      htmlString = ''
      var updatedTime = TimeParser.recentTimeParse(xhr[0].created);
      for (i in xhr) {
        $(this).closest('.face.back').find('.news').append(TweetFormat.new(xhr[i]));
      }
      $cardBack = $(this).closest('.face.back');
      $cardBack.find('.updated-at-value').html(updatedTime);
      $cardBack.find('.last').html(TimeParser.writtenTime(updatedTime));
      $(this).closest('.card').addClass('flipped');
      self.handleExternalLinks();
    });

    $('.update-twitter').on("ajax:error", function(event, xhr, status, error){
      console.log('errrrrrrorr')
      $(this).closest('.card').addClass('flipped');
      self.handleExternalLinks();
    });

    $(document).on('ajax:success','.delete', function(event, xhr, status, error) {
      console.log(event)
      $('#container').isotope('remove', $(event.target).closest('.card-wrapper'));
      // $(this).closest('.flip').fadeOut('slow');  
    }); 
  },

  handleExternalLinks: function() {
    $("a[href^=http]").each(function(){
      if(this.href.indexOf(location.hostname) == -1) {
         $(this).attr({
            target: "_blank",
            title: "Opens in a new window"
         });
      }
    });
  },

  load: function() {
    $('.update-twitter').click();
  }
};

var DragDrop = {
  init: function() {
    var self = this;
    $(window).resize(function() {
      // loadCards();
      // $('.card').addClass('flipped');
      self.makeCardsDraggable();
      self.makeDecksDroppable();
      $('.flip').fadeIn(600);
    });    
  },

  makeCardsDraggable: function() {
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
      // TODO-JW: figure out positioning
      cursor    : 'move',
      cursorAt  : { left : 5 },
      appendTo  : 'body',
      zIndex    : 999
    });
  },

  makeDecksDroppable: function() {
    $(".board-link").droppable({
      drop        : this.addCardToDeck,
      hoverClass  : 'drop-hover'
    });
  },

  addCardToDeck: function(event, ui) {
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
    });
  }
};

var TimeParser = {

  makeItLookNice: function(seconds){
    var times = [1,60,60,24,7,52]
    var labels = ['s','m','h','d','w','y']
    var i = 0;
    while (seconds/times[i] >= 1){
      seconds = seconds/times[i]
      i++;
    }
    return (String(Math.floor(seconds))+labels[i-1])
  },

  recentTimeParse: function(time){
    var datetime = time.split("T");
    var date = datetime[0].split('-');
    var time = datetime[1].split('-')[0].split(':');
    objectDate = Math.floor(new Date(date[0],date[1]-1,date[2],time[0],time[1],time[2])/1000);
    return objectDate;
  },

  writtenTime: function(epoch){
    var months = ['Jan','Feb','Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec'];
    var now = Math.floor(new Date()/1000);
    var timeAgo = now - (epoch-3);
    if (timeAgo < 0){
      return 'the future'; //should never happen     unless....oh my god, the FLUXXXXXX
    }
    else if (timeAgo < 2419000) {
      return this.makeItLookNice(timeAgo); //gives time ago ie '2d' or '4s'
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

}


$(document).ready(function() {
  LazyLoader.init();
  DragDrop.init();
  AddACard.init();

  LazyLoader.load();

});
