$(document).on("turbolinks:load", function() {
  store.state.experienceIds = $('#experience-ids').data("experience-ids");
  store.state.currentExperienceId = $(".js-next").data("id");
  store.state.currentUser = $('#current-user').data("current-user");
  next();
})

var store = {
  state: {
    experienceIds: [],
    currentExperienceId: undefined,
    experiences: [],
    currentUser: undefined
  }
}

function getNextExperienceId() {
  const { experienceIds, currentExperienceId } = store.state
  var index = experienceIds.findIndex(id => id === currentExperienceId)
  if (index === experienceIds.length - 1) {
    return experienceIds[0]
  }
  return experienceIds[index + 1]
}

function next() {
  $(".js-next").on("click", function(event) {
    event.preventDefault();
    const nextExperienceId = getNextExperienceId()
    const venueId = parseInt($(".js-next").attr("data-venue"));
    $.get("/venues/" + venueId + "/experiences/" + nextExperienceId + ".json", function(experienceData) {
      store.state.currentExperienceId = experienceData.id
      $(".experience_show h2").text(experienceData.title)
      $(".experience_show p#genre").html("<strong>Genre: </strong>" + experienceData.genre)
      $(".experience_show p#description").html("<strong>Description: </strong>" + experienceData.description)

      experienceData.categories.forEach(function(category) {
        $(".categories_list").html(`<strong>Categories: </strong><a href="/categories/${category.id}">${category.name}</a>` + " | ")
      })

      $(".button_to").attr('action', `/user_experiences?experience_id=${experienceData.id}`)
    })
  })
}
