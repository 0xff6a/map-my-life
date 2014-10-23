$(document).ready(function() {
  $('.run').draggable({ containment: 'main', 
                        helper: 'clone'
                      });

  $( '.run_target_panel' ).droppable({  accept: '.run', 
                                        drop: function(event, ui) {
                                          linkRunToTarget(ui, $(this));
                                        } 
                                      });

  function linkRunToTarget(ui, destination) {
    var runId    = ui.draggable.find('.run_id').text(),
        targetId = destination.find('.target_id').text(),
        postUrl  = '/runs/' + runId + '/targets/link';

        console.log(targetId);
    $.post(postUrl, { workouts: { targets: targetId } }, function(response) {
      console.log('hi');
    });
  }
});