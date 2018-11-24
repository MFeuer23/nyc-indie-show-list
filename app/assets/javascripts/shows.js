$(function () {
  $(".js-view-shows").on('click', function(e) {
    e.preventDefault();
    let id = $(this).data("id");
    jQuery.get("/artists/" + id + "/shows.json", function(data) {
      $(".js-shows-upcoming").html("<h4>" + "Upcoming Shows" + "</h4>")
      $(".js-shows-past").html("<h4>" + "Past Shows" + "</h4>")
      console.log(data)
      $.each(data, function(index, value) {
        let date = new Date(value["date"])
        if (date >= new Date()) {
          $(".js-shows-upcoming").append("<li>" + "<a href='/shows/" + value["id"] + "'>" + formatDate(date) + " at " + value["venue"]["name"] + "</a>" + "</li>");
        } else {
          $(".js-shows-past").append("<li>" + "<a href='/shows/" + value["id"] + "'>" + formatDate(date) + " at " + value["venue"]["name"] + "</a>" + "</li>");
        }

      })
    });
  });
});

function formatDate(date) {
  var monthNames = [
    "January", "February", "March",
    "April", "May", "June", "July",
    "August", "September", "October",
    "November", "December"
  ];

  var day = date.getDate();
  var monthIndex = date.getMonth();
  var year = date.getFullYear();

  return monthNames[monthIndex] + ' ' + day + ', ' + year;
}
