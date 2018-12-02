$(document).on('turbolinks:load', function () {
  $("form").on("submit", function(e) {
    e.preventDefault();

      let values = $(this).serialize();
      let jsShow;
      console.log(values);

      let showPosting = $.post('/shows.js', values, function(showData) {
        if (!showData["venue"]) {
          $.post('/venues.js', values, function(venueData) {
            showData["venue"] = new Venue(showData, venueData)
            jsShow = new Show(showData)
            jsShow.appendToDom("js-posted-object")
          })
        } else {
          jsShow = new Show(showData)
          console.log(jsShow)
          jsShow.appendToDom("js-posted-object")
        }
        console.log(jsShow)
      });
      showPosting.done(console.log(jsShow))

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
