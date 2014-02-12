$(document).ready(function() {
  $('#find_user').on('submit', function(e) {
    e.preventDefault();
    $("#input-user").empty();
    getUser();
  })
});

Output = function() {
  this.template = document.getElementById('template').innerHTML;
  this.userInfo = null;
}

Output.prototype.getInfo = function(response) {
  var userInfo = {
    name: response.name,
    location: response.location,
    repos_url: "https://github.com/" + response.login + "?tab=repositories",
    created_at: response.created_at,
    avatar_url: response.avatar_url
  };
  return userInfo;
}

function getUser() {
  view = new Output();
  $.get("https://api.github.com/users/" + $('.username').val(), function(response) {
    view.userInfo = view.getInfo(response);
    $('#input-user').append(Mustache.render(view.template, view.userInfo));
  })
}