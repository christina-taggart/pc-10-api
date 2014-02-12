$(document).ready(function() {
  $('#stalker').on("submit", function(event) {
    event.preventDefault();
    removePreviousPerson();
    getUserDataFromGitHub();
  })
});

getUserDataFromGitHub = function() {
  view = new ViewModifier ();
  $.get("https://api.github.com/users/" + $('.username').val(), function(response) {
    view.newInfo = view.determineNewInfo(response);
    $('#initial_search').append(Mustache.render(view.template, view.newInfo));
  })
}

removePreviousPerson = function() {
  $('#initial_search #stalkee').remove();
}

// ViewModifier object
ViewModifier = function () {
  this.template = document.getElementById('template').innerHTML;
  this.newInfo = null;
}

ViewModifier.prototype.determineNewInfo = function(response) {
  var newInfo = {
    name: response.name,
    location: response.location,
    repos_url: "https://github.com/" + response.login + "?tab=repositories",
    followers: response.followers,
    avatar_url: response.avatar_url
  };
  return newInfo;
}
// ==================================================================== //

// GitHubUserDataFetcher object
// GitHubUserDataFetcher = function () {
//   this.userData = null;
// }

// GitHubUserDataFetcher.prototype.fetchNewData = function () {
//   var stuffIWant = '';
//   $.get("https://api.github.com/users/" + $('.username').val(), function(response) {
//     stuffIWant = response;
//   })
//   .done(function() {
//     return stuffIWant;
//   })
// }

// newData = new GitHubUserDataFetcher();
// newData.userData = newData.fetchNewData();

// ==================================================================== //
