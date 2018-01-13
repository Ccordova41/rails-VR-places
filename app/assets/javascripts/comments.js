$(document).on("turbolinks:load", function() {
  $(".comments ul").text("");
   renderComments();
   submitComments();
})

var current_user = null;

function renderComments() {
  getCurrentUser();
  var experienceId = window.location.href.split("/")[6]
  var venueId = window.location.href.split("/")[4]
  $.get(`/experiences/${experienceId}/user_comments`, function(comments) {
    comments.forEach(function(comment) {
      if (current_user && current_user.username === comment.user.username && parseInt(experienceId) === comment.experience.id) {
        $(".comments ul").append("<li>" + comment.user.username + ": " + comment.comments + "</li>" + `<a href="/experiences/${experienceId}/user_comments/${comment.id}/edit">` + "Edit" + "</a>")
      } else if (parseInt(experienceId) !== comment.experience.id) {
        $(".comments ul").append("")
      } else if (current_user && current_user.username !== comment.user.username && parseInt(experienceId) === comment.experience.id) {
        $(".comments ul").append("<li>" + comment.user.username + ": " + comment.comments + "</li>")
      }
    })
  })
}


function getCurrentUser() {
  $.get('/current_user', function(user) {
    if (user) {
      current_user = user
    }
  })
}

function submitComments() {
  $("#new_user_comment").on('submit', function(event) {
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $("textarea#user_comment_comments").val("")
        $(".comments ul").append("<li>" + response.user.username + ": " + response.comments + "</li>" + `<a href="/experiences/${response.experience.id}/user_comments/${response.id}/edit">` + "Edit" + "</a>")
      }
    })
  })
}
