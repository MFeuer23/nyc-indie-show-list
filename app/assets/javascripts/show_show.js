$(function () {
  $(".js-next").on("click", function() {
    let nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/shows/" + nextId + ".json", function(data) {
      console.log(data)
      $("#artist_name").text(data["artist"]["name"])
      $("#venue_name").text(data["venue"]["name"])
      $("#show_date").text(data["date"])
      $("#show_info").text(data["info"])
      $("#venue_address").text(data["venue"]["address"])
      $("#show_specific_links").text("")
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
