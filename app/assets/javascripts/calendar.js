$(document).ready(function() {
  $('#calendar').fullCalendar({
    events: "/sightings/get_events",
    header: {
          left:   'title',
          center: 'today prev,next',
          right:  'month agendaWeek basicDay'
    },
    timeFormat: "LT",
    eventClick: function(event) {
      if (event.url) {
          window.open(event.url);
          return false;
      }
    }

  });

})
