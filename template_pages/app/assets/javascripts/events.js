var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      locale: 'pt-br',
      events: '/events.json',
      select: function(start, end) {
        $.getScript('/events/new', function() {
          $('#event_date_range').val(moment(start).format("DD/MM/YYYY HH:mm") + ' - ' + moment(end).format("DD/MM/YYYY HH:mm"));
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = {
          event: {
            id: event.id,
            start_at: event.start.format(),
            end_at: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },

      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {
          $('#event_date_range').val(moment(event.start).format("DD/MM/YYYY HH:mm") + ' - ' + moment(event.end).format("DD/MM/YYYY HH:mm"));
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
        });
      }
    });
  })
};

var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').daterangepicker({
    locale: {
      locale: 'pt-br',
      "applyLabel": "Salvar",
      "cancelLabel": "Cancelar",
      "fromLabel": "Início",
      "toLabel": "Fim"
    },
    timePicker: true,
    timePickerIncrement: 10,
    format: 'DD/MM/YYYY h:mm A',
    //parentEl: "#eventForm"
  }, function(start, end, label) {
    $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
    $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
  });
};

$(document).on('turbolinks:load', initialize_calendar);

$(document).on('shown.bs.modal', "#eventForm", function () {
  $('select').select2({ dropdownParent: $("#eventForm") });
  date_range_picker();
});
