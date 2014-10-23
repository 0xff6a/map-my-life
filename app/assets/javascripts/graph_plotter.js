$(document).ready(function() {
  var $chartHolder = $('#placeholder');

  $.get( '/graphs/graph_data', function(response) {
    $.plot($chartHolder, [response], 
            { 
              xaxis: {mode: 'time', timeformat: '%d/%m/%y'} 
            });
  });
});

  
