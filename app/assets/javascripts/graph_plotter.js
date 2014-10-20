$(document).ready(function() {
  var $chartHolder = $('#placeholder')

  $.get( '/graphs/sample_data', function(response) {
    console.log(response);
    $.plot($chartHolder, [response]);
  });
});

  
