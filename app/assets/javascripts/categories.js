class Experience {
  constructor(title, genre, description, id, venue_id) {
    this.title = title
    this.genre = genre
    this.description = description
    this.id = id
    this.venue_id = venue_id
  }

  render() {
    var experienceLi = "<li>" + `<a href="/venues/${this.venue_id}/experiences/${this.id}">` + `${this.title} | ${this.description} | ${this.genre}` + "</a></li>"
    return experienceLi
  }
}

$(document).on('turbolinks:load', function() {
   renderExperiences();
})

function renderExperiences() {
    if (window.location.href.match(/\/categories\/(\d+)$/)) {
      $.get(`${window.location.href}/experiences`, function(data) {
        console.log(data)
        data.forEach(function(experience) {
          var html = new Experience(experience.title, experience.genre, experience.description, experience.id, experience.venue.id).render()
          $(".experience_list ul").append(html)
        })
      })
    }
}
