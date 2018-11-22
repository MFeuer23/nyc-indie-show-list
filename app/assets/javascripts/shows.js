$(function () {
  $(".js-view-shows").on('click', function(e) {
    e.preventDefault;
    let id = $(this).data("id");
    jQuery.get("/artists/" + 6 + ".json", function(data) {
      console.log(data);
    });
  });
});
