$(document).on('turbolinks:load', function () {
  $(".js-form-render").hide();
  $(".js-new-show").on("click", function(e) {
    e.preventDefault();
    $(".js-form-render").toggle();
    });
  });
