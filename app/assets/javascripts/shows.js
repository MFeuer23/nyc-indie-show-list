$(function () {
  $(".js-view-shows").on('click', function(e) {
    e.preventDefault();
    let id = $(this).data("id");
    jQuery.get("/artists/" + id + ".json", function(data) {
      $.each(data["shows"], function(index, value) {
        $(".js-shows").append(value["date"]);

      })

    });
  });
});
