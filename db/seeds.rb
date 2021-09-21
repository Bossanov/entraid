Article.destroy_all
Articlecommit.destroy_all
Message.destroy_all
Messagecommit.destroy_all
Profile.destroy_all
Contact.destroy_all
User.destroy_all
Conversation.destroy_all
Conversationcommit.destroy_all

puts "***--- ADMIN #1 CREATION ---***"
user = User.create!(
    email: "staumont.antoine@me.com",
    password: "Bossanova1",


)
  prof = Profile.create!(
    first_name: "Antoine",
    last_name: "STAUMONT",
    job: "Chirurgien-dentiste",
    phone_number: "0660954702",
    birthday: "07/04/1977",
    city: "Hardelot",
    pseudo: "Admin",
    statut: "yes",
    admin: "yes",
    biography: "Ancien burnouté et chirurgien-dentiste. Je suis actuellement entrepreneur et libre de concrétiser mes idées et mes pensées.",
    user_id: user.id,
  )


