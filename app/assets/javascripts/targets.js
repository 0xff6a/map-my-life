$(document).ready(function() {
  $('.run').draggable({ containment: 'main', 
                        helper: 'clone'
                      });

  $( '.run_target_panel' ).droppable({  accept: '.run', 
                                        hoverClass: 'highlight',
                                        drop: function(event, ui) {
                                          var $target = $(this);

                                          linkRunToTarget(ui, $target);
                                        } 
                                      });

  function linkRunToTarget(ui, destination) {
    var runId    = ui.draggable.find('.run_id').text(),
        targetId = destination.find('.target_id').text(),
        postUrl  = '/runs/' + runId + '/targets/api_link';

    $.post(postUrl, { workout: { targets: targetId } }, function(response) {
      if(response.status === 'OK') {
        // location.reload();
      } else {
        console.log('error in linking');
      }
    });
  }
});