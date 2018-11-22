$(function () {
  $(".js-view-shows").on('click', function(e) {
    e.preventDefault();
    let id = $(this).data("id");
    jQuery.get("/artists/" + id + ".json", function(data) {
      $(".js-shows-upcoming").html("<h4>" + "Upcoming Shows" + "</h4>")
      $(".js-shows-past").html("<h4>" + "Past Shows" + "</h4>")
      $.each(data["shows"], function(index, value) {

        if (new Date(value["date"]) >= new Date()) {

          $(".js-shows-upcoming").append("<li>" + value["date"] + "</li>");
        } else {
          $(".js-shows-past").append("<li>" + value["date"] + "</li>");
        }

      })

    });
  });
});
