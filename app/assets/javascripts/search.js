$(document).ready(function() {

  function makeCardsDraggable() {
    $(".result-card").draggable({
      helper: 'clone',
      cursor: 'move'
    })
  }

  function makeDecksDroppable() {
    $(".board-link").droppable({
      drop: addCardToDeck
    })
  }

  makeCardsDraggable();
  makeDecksDroppable();
});
