# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

paris = User.create(f_name: 'Paris', l_name: 'Hilton', username: 'philton', email:'paris@gmail.com', password: 'codeplatoon')

deja = User.create(f_name: 'Deja', l_name: 'B', username: 'dbaker', email:'deja@gmail.com', password: 'codedelta')

4.times do

  new_pet = Pet.create(breed: Faker::ElderScrolls.creature, name: Faker::Simpsons.character, user_id: paris.id)

  new_link = MediaLink.create(user_id: paris.id, link: "some random link", link_type:['video','image'].sample())

  PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)

end


new_pet = Pet.create(breed: Faker::ElderScrolls.creature, name: Faker::Simpsons.character, user_id: deja.id)

new_link = MediaLink.create(user_id: paris.id, link: "some random link", link_type:['video','image'].sample())

PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
