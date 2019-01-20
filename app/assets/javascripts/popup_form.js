function fill_form(form_id, json_obj, obj_name) {
  var id = json_obj.id;
  var remote_submit_path = '/' + obj_name + 's/' + id;

  $("#todo_form").attr('action', remote_submit_path);


  for(key in json_obj)
  {
    if(json_obj.hasOwnProperty(key))
      $('#todo_form input[name="' + obj_name + '['+key+']"]').val(json_obj[key]);
  }
}

$(document).on('click', '[data-toggle="modal"]', function(event) {
  var element = event.target;
  var id = $(element).data("id");
  var name = $(element).data("class");

  fill_form("todo_form", gon[name][id], name);
});