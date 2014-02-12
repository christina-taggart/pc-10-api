$(document).ready(function() {
  $('#stalker').on("submit", function(event) {
    event.preventDefault();
    $.get("https://api.github.com/users/" + $('.username').val(), function(response) {
      console.log(response);
    })
  })
});


// $.get( "ajax/test.html", function( data ) {
//   $( ".result" ).html( data );
//   alert( "Load was performed." );
// });