$(function() {
  $(".swimlane").sortable({
    revert: true,
    connectWith: '.swimlane',
    
    update: function(event, ui) {
      var cardId = /card-(\d+)/.exec(ui.item.get(0).id)[1];
      var swimlaneId = /swimlane-(\d+)/.exec(ui.item.parent().get(0).id)[1];
      console.log(cardId + " -> " + swimlaneId);
      $.ajax({
        url: "/cards/" + cardId + "/moves",
        data: {'card[swimlane_id]': swimlaneId},
        type: 'POST'
      })
    }
  });
  $("ul, li").disableSelection();
});