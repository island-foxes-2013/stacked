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

  $('.update').on("ajax:success", function(event, xhr, status, error){
    htmlString = ''
    for (i in xhr) {
      htmlString += tweet(xhr[i])
    }
    $(this).closest('.face.back').append(htmlString);
  });
    
  // $(document).on('click','.card.flipped',function(){
  //   console.log(this);
  //   var handle = '@CrabCaker'
  //   var content = 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam erat volutpat. Pellentesque in erat cras amet.'
  //   $(this).find('.face.back').append(tweetFormat(handle,content));
  // });

  $(window).resize(function() {
    console.log($('.all_cards').width());
    loadCards();
    $('.flip').fadeIn(600);
    $('.card').addClass('flipped');
    makeCardsDraggable();
  });

});

function loadCards(){
  var windowSize = $(window).width();
  // console.log(windowSize);

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

function tweet(tweet){
  if (tweet.url) {
    return tweetPicture(tweet.tweet_id, tweet.text, tweet.picUrl)
  }
  return tweetFormat(tweet.tweet_id, tweet.text)
}

function tweetFormat(tweet_id, content) {
  return "<div class='tweet'>"+
            "<span>"+tweet_id+"</span>" + 
            "<div class='content'>" +
              content +
            "</div>" +
          "</div>"
}

function tweetPicture(tweet_id, content, picUrl) {
  return "<div class='tweet'>"+
            "<img src='"+picUrl+"' alt='Shiiit'>" +
            "<span>"+tweet_id+"</span>" + 
            "<div class='content'>" +
              content +
            "</div>" +
          "</div>"
}

function makeCardsDraggable() {
  console.log($(".mini-pic"));
  $(".card").find(".header").draggable({
    helper: 'clone'
  });
}

****************************************************

function Card(id, name) {
  this.id = id;
  this.name = name;
}

// Item.prototype.render = function() {
//   return "<tr class='item'>\
//             <td class='item_name'>"+this.name+"</td>\
//             <td class='item_price'>"+this.price+"</td>\
//           </tr>"
// }

var addCardToBoard = function(){
  // var private = {
  //     items:[],
  //     tableBody:(function(){
  //       return $('#grocery_list').find('tbody')
  //     })  ,
  //   }
  // private.total = function() {
  //   var total = 0;
  //   for (i in this.items) {
  //     total += this.items[i].price;
  //   }
  //   return total.toFixed(2);
  // }

  public.addToList = function(event, ui) {
    var dragged_item = $(ui.draggable);
    var item =  new Item(dragged_item.find(".item_name").text(),dragged_item.find(".item_price").text());
    public.addItem(item);
  }
  return public
}

// ****************************************************

function BoardCard() {
  $('.card .header').draggable('click',function() {
    console.log("in card click listener")
  })

}



