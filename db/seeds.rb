# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#location
location_1 = Location.create!(name: "New York City, NY")
location_2 = Location.create!(name: "Littleton, CO")
location_3 = Location.create!(name: "Boston, MA")

#venues
venue_1 = Venue.create!(name: "Jump into the Light", description: "Jump Into The Light is America’s first virtual reality cinema, play lab and studio. Located on the Lower East Side of Manhattan, it provides an array of virtual- and augmented-reality experiences: skydive in VR; climb a mountain; fly around the world in 360° video; arcade and gaming experiences.", location_id: location_1.id, rating: "5")
venue_2 = Venue.create!(name: "VR World", description: "VR World is the largest virtual reality experience center located in North America and the Western Hemisphere. It features the finest and most diverse virtual reality experiences that can be used in a public setting. Unlike other venues that concentrate on a single area or genre, VR World aims to deliver the best of virtual reality taking its guests to as many destinations as possible.", location_id: location_2.id, rating: "4")
venue_3 = Venue.create!(name: "Harvard's HUB for AR, VR, and Mixed Reality", description: "Launched in November 2011, the Harvard Innovation Lab (i-lab) is a resource for any student at Harvard interested in entrepreneurship and innovation.", location_id: location_3.id, rating: "5")

#experiences
experience_1 = Experience.create!(title: "VR Cinema", genre: "cinema", description: "Watch 360 Videos", venue_id: venue_1.id)
experience_2 = Experience.create!(title: "Mountain Climbing", genre: "nature", description: "Climb heights without the danger", venue_id: venue_2.id)
experience_3 = Experience.create!(title: "A ZOMBIE SURVIVAL TUTORIAL", genre: "adventure", description: "Arizona Sunshine puts you in the midst of a zombie apocalypse. Handle weapons with real-life movements, freely explore a post-apocalyptic world, and put your survival skills to the test in VR – putting the undead back to rest is more thrilling than ever before.", venue_id: venue_1.id)
experience_4 = Experience.create!(title: "THE OTHERWORLDLY PAINTING", genre: "nature", description: "Experience painting as you have never before. ", venue_id: venue_3.id)

#categories
action = Category.create!(name: "Action")
adventure = Category.create!(name: "Adventure")
travel = Category.create!(name: "Travel")

#experience_categories
experience_categories = ExperienceCategory.create!(experience_id: experience_1.id, category_id: action.id)
experience_categories_1 = ExperienceCategory.create!(experience_id: experience_3.id, category_id: adventure.id)
experience_categories_2 = ExperienceCategory.create!(experience_id: experience_2.id, category_id: travel.id)
