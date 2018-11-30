$(document).on('turbolinks:load', function () {
  $("form").on("submit", function(e) {
    e.preventDefault();

      var values = $(this).serialize();
      console.log(values);
debugger;
      $.post('/shows.js', values, function(data) {
        console.log(data)
      });


    });
  });
