$(document).ready(function() {
  $('#stalker').on("submit", function(event) {
    event.preventDefault();
    $.get("https://api.github.com/users/" + $('.username').val(), function(response) {
      modifyView(response);
    })
  })
});

modifyView = function(response) {
  var template = document.getElementById('stalkee').innerHTML;
  var newInfo = {
    name: response.name,
    location: response.location,
    bio: response.bio,
    blog: response.blog,
    avatar_url: response.avatar_url
  };
  $('#stalker').append(Mustache.render(template, newInfo));
}


// $.get( "ajax/test.html", function( data ) {
//   $( ".result" ).html( data );
//   alert( "Load was performed." );
// });