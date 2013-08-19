$(document).ready(function() {

  // function makeResultsCardsDraggable() {
  //   $(".result-card").draggable({
  //     helper: 'clone',
  //     cursor: 'move'
  //   })
  // }

  // function makeResultsDecksDroppable() {
  //   $(".board-link").droppable({
  //     drop: addResultsCardsToDeck
  //   })
  // }

  // function addResultsCardToDeck(event,ui) {
  //   var card = ui.draggable.closest('.result-card');
  //   var board = $(this);
  //   console.log( 'The square with ID "' + card.attr('id') + '" was dropped onto ' + board.attr('id'));
  //   $.ajax({
  //     url: '/board_cards',
  //     method: 'post',
  //     data: {board_slug: board.attr('id'), card_slug: card.attr('id')}
  //   }).done(function(data) {
  //     console.log(data)
  //   };
  // }


  // makeResultsCardsDraggable();
  // makeResultsDecksDroppable();
});
