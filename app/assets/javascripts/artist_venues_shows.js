$(function () {
  $(".js-view-venues").on('click', function(e) {
    e.preventDefault();
    let id = $(this).data("id");
    jQuery.get("/artists/" + id + "/venues.json", function(data) {
      console.log(data)
      $(".js-venues").html("<h4>" + "Venues Played" + "</h4>")
      $.each(data, function(index, value) {
        let date = new Date(value["date"])
        $(".js-venues").append("<li>" + "<a href='/venues/" + value["id"] + "'>"
        + value["name"] + "</a>" + " // " + "<a href='#' class='js-show-dates' data-id='" + value["id"]
        + "'>See All Show Dates</a>" + "</li>");
        $(".js-venues").append("<ul><div class='" + value["id"] + "'></div></ul>")
      })
        $(".js-show-dates").on('click', function(e) {
          e.preventDefault();
          let venue_id = $(this).data("id");
          $("." + venue_id).append("<li>hello</li>")
        })
    });
  });
});
