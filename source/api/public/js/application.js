$(document).ready(function() {
  $('#stalker').on("submit", function(event) {
    event.preventDefault();
    getUserDataFromGitHub();
  })
});

// ViewModifier object
ViewModifier = function () {
  this.template = document.getElementById('stalkee').innerHTML;
  this.newInfo = 0;
}

ViewModifier.prototype.fetchNewInfo = function(response) {
  var newInfo = {
    name: response.name,
    location: response.location,
    repos_url: "https://github.com/" + response.login + "?tab=repositories",
    followers: response.followers,
    avatar_url: response.avatar_url
  };
  return newInfo;
}

getUserDataFromGitHub = function() {
    view = new ViewModifier ();
  $.get("https://api.github.com/users/" + $('.username').val(), function(response) {
    view.newInfo = view.fetchNewInfo(response);
    $('#stalker').append(Mustache.render(view.template, view.newInfo));
  })
}