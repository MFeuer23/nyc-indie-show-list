$(function () {
  $(".js-next").on("click", function() {
    let nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.getJSON("/shows/" + nextId + ".json", function(data) {
      console.log(data)
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
