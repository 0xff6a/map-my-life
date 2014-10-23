$(document).ready(function() {
  var $chartHolder = $('#placeholder');

  $.get( '/runs/graph_data', function(response) {
    $.plot($chartHolder, [response], 
            { 
              xaxis: {mode: 'time', timeformat: '%d/%m/%y'} 
            });
  });
});

  
