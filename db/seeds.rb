# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#location
location_1 = Location.create!(name: "New York City")
location_2 = Location.create!(name: "Littleton, Colorado")

#venues
venue_1 = Venue.create!(name: "Jump into the Light", description: "Jump Into The Light is America’s first virtual reality cinema, play lab and studio. Located on the Lower East Side of Manhattan, it provides an array of virtual- and augmented-reality experiences: skydive in VR; climb a mountain; fly around the world in 360° video; arcade and gaming experiences.", location_id: location_1.id)

#experiences
experience_1 = Experience.create!(title: "VR Cinema", genre: "cinema", description: "Watch 360 Videos", venue_id: venue_1.id)
experience_2 = Experience.create!(title: "Mountain Climbing", genre: "nature", description: "Climb heights without the danger", venue_id: venue_1.id)

#categories
action = Category.create!(name: "Action")
adventure = Category.create!(name: "Adventure")
travel = Category.create!(name: "Travel")

#experience_categories
experience_categories = ExperienceCategory.create!(experience_id: experience_1.id, category_id: action.id)
experience_categories_1 = ExperienceCategory.create!(experience_id: experience_1.id, category_id: adventure.id)
experience_categories_2 = ExperienceCategory.create!(experience_id: experience_2.id, category_id: travel.id)
