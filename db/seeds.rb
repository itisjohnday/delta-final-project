paris = User.create(f_name: 'Paris', l_name: 'Hilton', username: 'philton', email:'paris@gmail.com', password: 'codeplatoon')

deja = User.create(f_name: 'Deja', l_name: 'B', username: 'dbaker', email:'deja@gmail.com', password: 'codedelta')

4.times do

  new_pet = Pet.create(breed: Faker::ElderScrolls.creature, name: Faker::Simpsons.character, user_id: paris.id)

  new_link = MediaLink.create(user_id: paris.id, link: Faker::Avatar.image, link_type:'image/png')

  PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)

end


new_pet = Pet.create(breed: Faker::ElderScrolls.creature, name: Faker::Simpsons.character, user_id: deja.id)

new_link = MediaLink.create(user_id: paris.id, link: Faker::Avatar.image, link_type:'image/png')

new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)

new_entry = Entry.create!(pets_media_link_id: new_pets_media_link.id, vote_count: 0)

tournament = Tournament.create(theme: 'test')
round_prelim = Round.create(tournament_id: 1, name: 'Preliminary Round')
round_16 = Round.create(tournament_id: 1, name: 'Sweet 16')
round_8 = Round.create(tournament_id: 1, name: 'Elite 8')
round_4 = Round.create(tournament_id: 1, name: 'Final 4')
round_2 = Round.create(tournament_id: 1, name: 'Championship')

match_1 = Match.create(round_id: round_prelim.id, contestant_1_entry_id: new_entry.id)