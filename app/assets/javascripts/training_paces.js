$(document).ready(function() {
  
  $('.training_pace_popover').popover({
      placement: 'left',
      trigger: 'hover'
    });

  $('.training_pace_popover').on('click', function(event) {
    event.preventDefault();
  });
});
