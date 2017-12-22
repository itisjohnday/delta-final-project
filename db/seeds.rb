admin = User.create(f_name: '', l_name: '', username: 'admin', email:'admin@tournapets.com', password: 'tournapets')

paris = User.create(f_name: 'Paris', l_name: 'Hilton', username: 'philton', email:'paris@tournapets.com', password: 'tournapets')
paris_images = [
  "https://delta-final.s3.amazonaws.com/philton383150388paris_cute.jpg",
  "https://delta-final.s3.amazonaws.com/philton149738250paris_santa.jpg"
]
new_pet = Pet.create(breed: 'Chihuahua', name: 'Tinkerbell', user_id: paris.id, profile_pic: paris_images[0])
new_link = MediaLink.create(user_id: paris.id, link: paris_images[0], link_type:'image/jpg')
new_link2 = MediaLink.create(user_id: paris.id, link: paris_images[1], link_type:'image/jpg')
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link2.id)

deja = User.create(f_name: 'Deja', l_name: 'Baker', username: 'dbaker', email:'deja@tournapets.com', password: 'tournapets')
deja_images = [
  "https://delta-final.s3.amazonaws.com/dbaker519172223deja_cute.jpg",
  "https://delta-final.s3.amazonaws.com/dbaker693775044deja_santa.jpg"
]
new_pet = Pet.create(breed: 'French Bulldog', name: 'Spike', user_id: deja.id, profile_pic: deja_images[0])
new_link = MediaLink.create(user_id: deja.id, link: deja_images[0], link_type:'image/jpg')
new_link2 = MediaLink.create(user_id: deja.id, link: deja_images[1], link_type:'image/jpg')
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link2.id)

tim = User.create(f_name: 'Tim', l_name: 'Cook', username: 'tcook', email:'tim@tournapets.com', password: 'tournapets')
tim_images = [
  "https://delta-final.s3.amazonaws.com/tcook950929005tim_cute.jpg",
  "https://delta-final.s3.amazonaws.com/tcook617434783tim_santa.jpg"
]
new_pet = Pet.create(breed: 'Golden Retriever', name: 'Gus', user_id: tim.id, profile_pic: tim_images[0])
new_link = MediaLink.create(user_id: tim.id, link: tim_images[0], link_type:'image/jpg')
new_link2 = MediaLink.create(user_id: tim.id, link: tim_images[1], link_type:'image/jpg')
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link2.id)

jon = User.create(f_name: 'Jon', l_name: 'Young', username: 'jyoung', email:'jon@tournapets.com', password: 'tournapets')
jon_images = [
  "https://delta-final.s3.amazonaws.com/jyoung300732121jon_cute.jpg",
  "https://delta-final.s3.amazonaws.com/jyoung434047436jon_santa.jpg"
]
new_pet = Pet.create(breed: 'Labrador Retriever', name: 'Scout', user_id: jon.id, profile_pic: jon_images[0])
new_link = MediaLink.create(user_id: jon.id, link: jon_images[0], link_type:'image/jpg')
new_link2 = MediaLink.create(user_id: jon.id, link: jon_images[1], link_type:'image/jpg')
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link2.id)

rod = User.create(f_name: 'Rod', l_name: 'Levy', username: 'rlevy', email:'rod@tournapets.com', password: 'tournapets')
rod_images = [
  "https://delta-final.s3.amazonaws.com/rlevy382372090rod_cute.jpg",
  "https://delta-final.s3.amazonaws.com/rlevy954111591rod_santa.jpg"
]
new_pet = Pet.create(breed: 'Beagle', name: 'Boomer', user_id: rod.id, profile_pic: rod_images[0])
new_link = MediaLink.create(user_id: rod.id, link: rod_images[0], link_type:'image/jpg')
new_link2 = MediaLink.create(user_id: rod.id, link: rod_images[1], link_type:'image/jpg')
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link2.id)

alex = User.create(f_name: 'Alex', l_name: 'Sachs', username: 'asachs', email:'alex@tournapets.com', password: 'tournapets')
alex_images = [
  "https://delta-final.s3.amazonaws.com/asachs992302303alex_cute.jpg",
  "https://delta-final.s3.amazonaws.com/asachs642579185alex_santa.jpg"
]
new_pet = Pet.create(breed: 'Basset Hound', name: 'Rex', user_id: alex.id, profile_pic: alex_images[0])
new_link = MediaLink.create(user_id: alex.id, link: alex_images[0], link_type:'image/jpg')
new_link2 = MediaLink.create(user_id: alex.id, link: alex_images[1], link_type:'image/jpg')
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link2.id)

mickey = User.create(f_name: 'Mickey', l_name: 'Witchuwong', username: 'mwitchuwong', email: 'mickey@tournapets.com', password: 'tournapets')
mickey_images = [
  "https://delta-final.s3.amazonaws.com/mwitchuwong848845196mickey_cute.jpg",
  "https://delta-final.s3.amazonaws.com/mwitchuwong961778259mickey_santa.jpeg"
]
new_pet = Pet.create(breed: 'English Bulldog', name: 'Bandit', user_id: mickey.id, profile_pic: mickey_images[0])
new_link = MediaLink.create(user_id: mickey.id, link: mickey_images[0], link_type:'image/jpg')
new_link2 = MediaLink.create(user_id: mickey.id, link: mickey_images[1], link_type:'image/jpg')
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link2.id)

kara = User.create(f_name: 'Kara', l_name: 'Carrell', username: 'kcarrell', email:'kara@tournapets.com', password: 'tournapets')
kara_images = [
  "https://delta-final.s3.amazonaws.com/kcarrell338652532kara_cute.jpg",
  "https://delta-final.s3.amazonaws.com/kcarrell439805237kara_santa.jpg"
]
new_pet = Pet.create(breed: 'Pug', name: 'Curly', user_id: kara.id, profile_pic: kara_images[0])
new_link = MediaLink.create(user_id: kara.id, link: kara_images[0], link_type:'image/jpg')
new_link2 = MediaLink.create(user_id: kara.id, link: kara_images[1], link_type:'image/jpg')
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link.id)
new_pets_media_link = PetsMediaLink.create(pet_id: new_pet.id, media_link_id: new_link2.id)

tournament = Tournament.create(theme: 'Cutest Puppy')
new_round = Round.create(tournament_id: tournament.id, name: 'Prelim Round')
i = 1
8.times do
  new_entry = Entry.create(pets_media_link_id: i, vote_count: rand(20..100))
  new_match = Match.create(round_id: new_round.id, contestant_1_entry_id: new_entry.id, contestant_2_entry_id: new_entry.id)
  i += 2
end

tournament2 = Tournament.create(theme: 'Holiday Fun')
new_round2 = Round.create(tournament_id: tournament2.id, name: 'Prelim Round')
i = 2
8.times do
  new_entry2 = Entry.create(pets_media_link_id: i, vote_count: rand(20..100))
  new_match2 = Match.create(round_id: new_round2.id, contestant_1_entry_id: new_entry2.id, contestant_2_entry_id: new_entry2.id)
  i += 2
end

10.times do
  Comment.create!(username: User.find(rand(2..7)).username, description: "SO CUTE!!", media_link_id: rand(1..5))
end


