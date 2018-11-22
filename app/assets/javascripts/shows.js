$(function () {
  $(".js-view-shows").on('click', function(e) {
    e.preventDefaults;
    let id = $(this).data("id");
    jQuery.get("/artist/" + 6 + ".json", function(data) {
      console.log(data);
    });
  });
});
