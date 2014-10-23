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
        postUrl  = '/runs/' + runId + '/targets/api_link';

    $.post(postUrl, { workout: { targets: targetId } }, function(response) {
      alert(response.status);
    });
  }
});