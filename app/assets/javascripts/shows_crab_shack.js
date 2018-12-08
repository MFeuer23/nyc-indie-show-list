$(document).on('turbolinks:load', function () {
  $(".js-crab-shack-shows").on('click', function(e) {
    e.preventDefault();
    let id = $(this).data("id");
    jQuery.get("/artists/" + id + "/shows.json", function(data) {
      console.log(data)
      let crabShackShows = data.filter((x) => x["venue"]["name"] == "The Crab Shack")
      $.each(crabShackShows, function(index, value) {
          let date = new Date(value["date"])
          $(".js-crab-shack-list").append("<li>" + "<a href='/shows/" + value["id"] + "'>" + formatDate(date) + " at " + value["venue"]["name"] + "</a>" + "</li>")

        // if (date >= new Date()) {
        //   $(".js-shows-upcoming").append("<li>" + "<a href='/shows/" + value["id"] + "'>" + formatDate(date) + " at " + value["venue"]["name"] + "</a>" + "</li>");
        // } else {
        //   $(".js-shows-past").append("<li>" + "<a href='/shows/" + value["id"] + "'>" + formatDate(date) + " at " + value["venue"]["name"] + "</a>" + "</li>");
        // }
      })
    });
  });
});
