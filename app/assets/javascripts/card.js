function getIcon(provider) {
  switch(provider) {
    case 'twitter':
      return "<span class='glyph social'>e</span>";
    case 'instagram':
      return "<span class='glyph social'>t</span>";
    case 'tumblr':
      return "<span class='glyph social'>y</span>";
  }
}

function formatIcon($post, postData) {
  $icon = $post.find(".link-icon").find('a');
  $icon.attr("href", postData.url);
  $icon.html(getIcon(postData.provider));
  return $post;
}

var TextFormat = {
  new: function(postData) {
    var $post = $(".templates").find(".text-post");
    $post.find(".content").html(postData.text);

    return formatIcon($post, postData);
  }
};

var PictureFormat = {
  new: function(postData) {
    var $post = $(".templates").find(".image-post");
    $post.find(".content").html(postData.text);

    var $picture = $post.find(".small")
    $picture.find('img').attr("src", postData.small_image);
    $post.find('a').attr('href', postData.standard_image);

    return formatIcon($post, postData);
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

    $('.get-posts').on("ajax:success", function(event, xhr, status, error){
      $news = $(this).closest('.face.back').find('.news')
      if (xhr) {
        htmlString = ''
        xhr = $.parseJSON(xhr.post_json);
        var updatedTime = xhr[0].created;
        $news.empty();
        for (i in xhr) {
          provider = xhr[i].provider;
          // console.log(provider);
          var $post = '';
          if (xhr[i].content == 'text') {
            $post = TextFormat.new(xhr[i]);
          }
          else {
            $post = PictureFormat.new(xhr[i]);
          }

          $news.append($post.html());
        }

        $cardBack = $(this).closest('.face.back');
        $cardBack.find('.updated-at-value').html(updatedTime);
        $cardBack.find('.last').html(TimeParser.writtenTime(updatedTime));

        $(this).closest('.card').addClass('flipped')
        self.handleExternalLinks();
      }
    });

    $('.get-posts').on("ajax:error", function(event, xhr, status, error){
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

  load: function(giveUp) {
    $('.get-posts').click();
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

        var $card = $(e.target).closest('.card');
        var $draggedCard = $('.dragged-card').clone();

        var twitter_handle = String($card.find('.mini-pic').attr('id'));
        var imgUrl = "http://res.cloudinary.com/demo/image/twitter_name/w_45,h_45,c_fill/"+ twitter_handle + ".jpg";
        var cardId = $card.closest('.card').attr("id");

        // Set attributes on clone
        $draggedCard.find('.name').text($card.find('.name').text());
        $draggedCard.find('.profile-pic').attr('src',imgUrl);
        $draggedCard.attr("id",cardId);

        // console.log($draggedCard);
        return $draggedCard[0];
      },
      // TODO-JW: figure out positioning
      cursor    : 'move',
      cursorAt  : { left : 5 },
      appendTo  : 'body',
      zIndex    : 999,
      opacity: 0.80
    });
  },

  makeDecksDroppable: function() {
    $(".board-dropzone").droppable({
      drop        : this.addCardToDeck,
      hoverClass  : 'drop-hover'
    });
  },

  addCardToDeck: function(event, ui) {
    var card = ui.draggable.closest('.card');
    console.log(card);
    var board = $(this).find('.board-link');
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

function refresh(){
  LazyLoader.load();
}

// function cardEdit(){
//   $(document).on('click', '.edit-card', function(){
//     console.log('yo')
//   });
// }

$(document).ready(function() {
  LazyLoader.init();
  DragDrop.init();
  AddACard.init();
  refresh();
  $(document).on('click', '.edit-card', function(){
    $form = $(this).closest('.card-wrapper').find('.edit-form');
    $(this).closest('.flip').find('.front').html($form.html());
    $(this).closest('.card').removeClass('flipped')
  });
  setTimeout(refresh,3000);
  setTimeout(refresh,3000);
  setInterval(refresh,30000);

});
