$(document).ready(function(){
  $("#edit").on('click', function(e){
    e.preventDefault();

    $("#editform").show();
  });

  $("#editform").on('submit', function(e){
    e.preventDefault();
    question_id = $(this).parent().attr('id');
    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;
    $.ajax({
      data: data,
      url: url,
      type: type
    }).done(function(response){
      $("#" + question_id).html(response);
    });
  });

  $("#new-question-button").on('click',function(e){
    e.preventDefault();
    $(this).hide();
    $("#popup-new-question").show();
  });

  $("#upvote").on('click', function(e){
    e.preventDefault();
    var target=$(this).
  });
});
