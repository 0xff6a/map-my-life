$(document).ready(function() {
  var $chartHolder = $('#placeholder');

  $.get( '/runs/graph_data', function(coordinates) {
    $.plot($chartHolder, [coordinates], 
            { 
              xaxis: {mode: 'time', timeformat: '%d/%m/%y'} 
            });
  });
});

  
