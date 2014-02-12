$(document).ready(function() {
  $('#stalker').on("submit", function(event) {
    event.preventDefault();
    $.get("https://api.github.com/users/" + $('.username').val(), function(response) {
      modifyView(response);
    })
    // $.get("https://api.github.com/users/" + $('.username').val() + "/following", function(response) {
    //   debugger
    // })
  })
});

modifyView = function(response) {
  var template = document.getElementById('stalkee').innerHTML;
  var newInfo = {
    name: response.name,
    location: response.location,
    repos_url: response.repos_url,
    followers: response.followers,
    avatar_url: response.avatar_url
  };
  $('#stalker').append(Mustache.render(template, newInfo));
}


// $.get( "ajax/test.html", function( data ) {
//   $( ".result" ).html( data );
//   alert( "Load was performed." );
// });