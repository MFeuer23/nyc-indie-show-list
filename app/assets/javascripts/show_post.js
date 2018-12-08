$(document).on('turbolinks:load', function () {
  $("#js-form").on("submit", function(e) {
    e.preventDefault();
      this[1]["value"] = $('meta[name="csrf-token"]').attr('content')
      let values = $(this).serialize();

      let jsShow;
      console.log(values);

      $.post('/shows.json', values, function(showData) {
        if (!showData["date"]) {$(".js-errors").append("No Date Entered. <a href='" + `${showData["artist"]["id"]}` + "'>Try Again.</a><br>")}
        if (!showData["venue"]["id"]) {
          $.post('/venues.json', values, function(venueData) {
            if (venueData["name"] == "") {$(".js-errors").append("No Venue Entered. <a href='" + `${showData["artist"]["id"]}` + "'>Try Again.</a>")}
            showData["venue"] = new Venue(showData, venueData)
            jsShow = new Show(showData)
            jsShow.appendToDom("js-posted-object")
          })
        } else {
          jsShow = new Show(showData)
          console.log(jsShow)
          jsShow.appendToDom("js-posted-object")
        }
      });
    });
  });

  class Show {
    constructor(data) {
      this.date = data["date"]
      this.info = data["info"]
      this.artist = data["artist"]
      this.venue = data["venue"]
    }
    appendToDom(class_name) {
      $(`.${class_name}`).html(
        "<h3>Posted Show....</h3>" +
        "<p> Date: " + `${formatDate(new Date(this.date))}` + "</p>" +
        "<p> Info: " + `${this.info}` + "</p>" +
        "<p> Artist: " + `${this.artist.name}` + "</p>" +
        "<p> Venue: " + `${this.venue.name}` + "</p>" +
        "<p> Address: " + `${this.venue.address}` + "</p>" +
        "<p> Contact: " + `${this.venue.contact}` + "</p>"
      )
    }
  }

  class Venue {
    constructor(showData, venueData) {
      this.name = venueData["name"]
      this.address = venueData["address"]
      this.contact = venueData["contact"]
      this.artist = showData["artist"]
      this.show = showData
    }
  }
