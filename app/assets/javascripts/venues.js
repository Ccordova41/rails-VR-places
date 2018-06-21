class Venue {
  constructor(name, id, rating, location_id) {
    this.name = name
    this.id = id
    this.rating = rating
    this.locationId = location_id
  }

  render(){
    const venueLi =  "<li> " + `<a href="/venues/${this.id}">` + `${this.name}` + `</a></br>
                    Rating: ${this.rating}` + ` ⭒` + " </li>"
    return venueLi
  }
}


$(document).on('turbolinks:load', function() {
   renderVenues();
   filterVenues();
})


function renderVenues() {
  $.get('/hello.json', function(data) {
    data.forEach(function(venue) {
      var html = new Venue(venue.name, venue.id, venue.rating, venue.locationId).render();
      $("#venue_list ul").append(html);
    })
  })
}

function filterVenues() {
  $(".filter :submit").on('click', function(e) {
    e.preventDefault();
    $("#venue_list ul").text("")
    var location = parseInt($(".filter option:selected").val());
    if(location){
      $.get('/hello.json', function(data) {
        data.forEach(venue => {
          if (venue.location_id === location) {
            var html = new Venue(venue.name, venue.id, venue.rating, venue.location_id).render();
            $("#venue_list ul").append(html);
          }
        })
      })
    } else {
      $("#venue_list ul").text("")
      renderVenues();
    }
  })
}
