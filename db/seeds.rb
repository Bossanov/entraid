#Article.destroy_all
#Articlecommit.destroy_all
#Message.destroy_all
#Messagecommit.destroy_all
#Profile.destroy_all
#Contact.destroy_all
#User.destroy_all
Conversation.destroy_all
Conversationcommit.destroy_all

puts "***--- ADMIN #1 CREATION ---***"
user = User.create!(
    email: "staumont.antoine@me.com",
    password: "123456",


)
  prof = Profile.create!(
    first_name: "Antoine",
    last_name: "STAUMONT",
    job: "Chirurgien dentiste",
    phone_number: "0660954702",
    birthday: "07/04/1977",
    city: "Hardelot",
    pseudo: "Bossanov",
    statut: "yes",
    admin: "yes",
    biography: "Chirugien dentiste reconverti en développeur web depusi Décembre 2017",

    user_id: user.id,
  )

puts "***--- ADMIN #2 CREATION ---***"
user = User.create!(
    email: "l.ranchere@orange.fr",
    password: "123456",


)
  prof = Profile.create!(
    first_name: "Loic",
    last_name: "RANCHERE",
    job: "Chirurgien dentiste",
    phone_number: "0670802305",
    birthday: "07/04/1962",
    city: "Sauzé-Vaussais",
    pseudo: "Loic",
    statut: "yes",
    admin: "yes",
    biography: "A remplir",

    user_id: user.id,
  )


puts "***--- ADMIN #3 CREATION ---***"
user = User.create!(
    email: "caromeaux@yahoo.fr",
    password: "123456",


)
  prof = Profile.create!(
    first_name: "Caroline",
    last_name: "MEAUX",
    job: "Chirurgien dentiste",
    phone_number: "0670802305",
    birthday: "08/04/1977",
    city: "Laventie",
    pseudo: "Caroline",
    statut: "yes",
    admin: "yes",
    biography: "A remplir STP",

    user_id: user.id,
  )






