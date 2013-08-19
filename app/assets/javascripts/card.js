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

var LazyLoader = {
  init: function() {
    var self = this;
    $('.update-twitter').on("ajax:success", function(event, xhr, status, error){
      console.log(xhr)
      htmlString = ''
      for (i in xhr) {
        $(this).closest('.face.back').find('.news').append(TweetFormat.new(xhr[i]));
        //htmlString += TweetFormat.new(xhr[i])
      }
      //$(this).closest('.face.back').find('.news').append(htmlString);
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


$(document).ready(function() {
  LazyLoader.init();
  DragDrop.init();

  LazyLoader.load();

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

  // $(document).on('click','.card.flipped',function(){
  //   console.log(this);
  //   var handle = '@CrabCaker'
  //   var content = 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Pellentesque in erat cras amet.'
  //   $(this).find('.face.back').append(tweetFormat(handle,content));
  // });
});