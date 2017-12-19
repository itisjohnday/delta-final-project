require 'rails_helper'
require 'rake'


RSpec.describe AboutController, type: :controller do
  render_views
  


  # let(:user) { User.create!(f_name: 'Paris', l_name: 'Hilton', username: 'philton', email:'paris@tournapets.com', password: 'tournapets') }

  # let(:tournament) {Tournament.create(theme: 'Cutest Puppy')}

  # 8.times do
  #   let {:new_link} {MediaLink.create(user_id: i, link: images[i-1], link_type:'image/jpg')}
  #   let {:new_pet} {Pet.create(breed: Faker::Dog.breed, name: Faker::Dog.name, user_id: i, profile_pic: images[i-1])}
  #   let {:new_pets_media_link} {PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)}
  #   let {:new_entry} {Entry.create(pets_media_link_id: new_pets_media_link.id, vote_count: rand(20..100))}
  #   if i % 2 == 0
  #     let {:new_pets_media_link2} {PetsMediaLink.create(pet_id: (i - 1), media_link_id: new_link.id)}
  #   end
  # i += 1
  # end

  # let(:round_prelim) {Round.create(tournament_id: tournament.id, name: 'Preliminary Round')}
  # i = 1
  # 8.times do
  #   Match.create!(contestant_1_entry_id: i, contestant_2_entry_id: i, round_id: 1)
  #   i += 1
  # end
  # let(:round_8) {Round.create(tournament_id: 1, name: 'Elite 8')}
  # let(:round_4) {Round.create(tournament_id: 1, name: 'Final 4')}
  # let(:round_2) {Round.create(tournament_id: 1, name: 'Championship')}


  # before { sign_in(User.first) }

  

end