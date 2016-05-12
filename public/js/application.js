$(function(){
  $("#edit").on('click', function(e){
    e.preventDefault();
    $("#editform").show();
  });

  $("#editform").on('submit', function(e){
    e.preventDefault();
    question_id = $(this).parent().parent().attr('id');
    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;
    $.ajax({
      data = data,
      url = url,
      type = type
    }).done(function(response){
      console.log(response);
      $("#" + question_id).html(response);
    });
  });
});
