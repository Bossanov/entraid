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
    email: "staumont.antoine@icloud.com",
    password: "Bossanova1",


)
  prof = Profile.create!(
    first_name: "Antoine",
    last_name: "STAUMONT",
    job: "Chirurgien dentiste",
    phone_number: "0661526441",
    birthday: "07/04/1977",
    city: "Hardelot",
    pseudo: "Bossanova1",
    statut: "yes",
    admin: "yes",
    biography: "",
    user_id: user.id,
  )

#@corrige1 = User.find(23)
#@corrige1.email = "corinne.sence@sfr.fr"
#@corrige1.save
#@corrige2 = User.find(56)
#@corrige2.email = "helgaboukan@hotmail.fr"
#@corrige2.save
#result = []
#@users = User.all
#@users.each do |user|
#  until result.include?(user.email)
 #   SubscribeToNewsletterService.new(user).call
 #   result << user.email
#  end
#end

