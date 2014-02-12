$(document).ready(function() {
  $('#stalker').on("submit", function(event) {
    event.preventDefault();
    getUserDataFromGitHub();
  })
});

getUserDataFromGitHub = function() {
  $.get("https://api.github.com/users/" + $('.username').val(), function(response) {
    modifyView(response);
  })
}

modifyView = function(response) {
  var template = document.getElementById('stalkee').innerHTML;
  var newInfo = {
    name: response.name,
    location: response.location,
    repos_url: "https://github.com/" + response.login + "?tab=repositories",
    followers: response.followers,
    avatar_url: response.avatar_url
  };
  $('#stalker').append(Mustache.render(template, newInfo));
}