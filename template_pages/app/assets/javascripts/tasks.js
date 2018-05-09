var date_picker;
date_picker = function() {
  $('.date-picker').datepicker({
    format: 'dd/mm/yyyy'
  });
};

$(document).on('shown.bs.modal', "#taskForm", function () {
  $('select').select2({ dropdownParent: $("#taskForm") });

  date_picker();

  $('select.trigger-change').on('select2:selecting', function(e){
    var user_ids = $("#task_user_ids").val() || [];
    var this_value = e.params.args.data.id;
    user_ids.push( this_value );
    $("#task_user_ids").val(user_ids).trigger('change');
  });

  $('#subtasks').on('cocoon:after-insert', function(e, added_task) {
    added_task.find('select').select2({ dropdownParent: $("#taskForm") });
    date_picker();
  });
});

