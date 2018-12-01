$(document).on('turbolinks:load', function () {
  $("form").on("submit", function(e) {
    e.preventDefault();

      var values = $(this).serialize();
      console.log(values);

      $.post('/shows.js', values, function(data) {
        console.log(data)
        debugger;
        let jsShow = new Show(data)

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
