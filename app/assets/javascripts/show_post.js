$(document).on('turbolinks:load', function () {
  $("form").on("submit", function(e) {
    e.preventDefault();

      var values = $(this).serialize();
      console.log(values);

      $.post('/shows.js', values, function(showData) {
        if (!showData["venue"]) {
          $.post('/venues.js', values, function(venueData) {
            showData["venue"] = new Venue(showData, venueData)
            let jsShow = new Show(showData)
            console.log(jsShow)
          })
        } else {
          let jsShow = new Show(showData)
          console.log(jsShow)
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
    formatDate() {
        let monthNames = [
          "January", "February", "March",
          "April", "May", "June", "July",
          "August", "September", "October",
          "November", "December"
        ];
        let date = new Date(this.date)
        let day = date.getDate();
        let monthIndex = date.getMonth();
        let year = date.getFullYear();

        return monthNames[monthIndex] + ' ' + day + ', ' + year;
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
