paris = User.create(f_name: 'Paris', l_name: 'Hilton', username: 'philton', email:'paris@tournapets.com', password: 'tournapets')
deja = User.create(f_name: 'Deja', l_name: 'Baker', username: 'dbaker', email:'deja@tournapets.com', password: 'tournapets')
tim = User.create(f_name: 'Tim', l_name: 'Cook', username: 'tcook', email:'tim@tournapets.com', password: 'tournapets')
jon = User.create(f_name: 'Jon', l_name: 'Young', username: 'jyoung', email:'jon@tournapets.com', password: 'tournapets')
rod = User.create(f_name: 'Rod', l_name: 'Levy', username: 'rlevy', email:'rod@tournapets.com', password: 'tournapets')
alex = User.create(f_name: 'Alex', l_name: 'Sachs', username: 'asachs', email:'alex@tournapets.com', password: 'tournapets')
mickey = User.create(f_name: 'Mickey', l_name: 'Witchuwong', username: 'mwitchuwong', email: 'mickey@tournapets.com', password: 'tournapets')
kara = User.create(f_name: 'Kara', l_name: 'Carrell', username: 'kcarrell', email:'kara@tournapets.com', password: 'tournapets')

i = 1
8.times do
  new_pet = Pet.create(breed: Faker::ElderScrolls.creature, name: Faker::Simpsons.character, user_id: i)
  new_link = MediaLink.create(user_id: i, link: "#{i}.jpeg", link_type:'image/png')
  new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
  new_entry = Entry.create(pets_media_link_id: new_pets_media_link.id, vote_count: rand(20..100))
  if i % 2 == 0
    new_pets_media_link2 = PetsMediaLink.create(pet_id: new_pet.id -1, media_link_id: new_link.id)
    new_entry2 = Entry.create(pets_media_link_id: new_pets_media_link2.id, vote_count: rand(20..100))
  end
  i += 1
end

tournament = Tournament.create(theme: 'Cutest Puppy')
round_prelim = Round.create(tournament_id: 1, name: 'Preliminary Round')
round_8 = Round.create(tournament_id: 1, name: 'Elite 8')
round_4 = Round.create(tournament_id: 1, name: 'Final 4')
round_2 = Round.create(tournament_id: 1, name: 'Championship')
