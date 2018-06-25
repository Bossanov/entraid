#Article.destroy_all
#Articlecommit.destroy_all
#Message.destroy_all
#Messagecommit.destroy_all
#Profile.destroy_all
#Contact.destroy_all
#User.destroy_all
#Conversation.destroy_all
#Conversationcommit.destroy_all

#puts "***--- ADMIN #1 CREATION ---***"
#user = User.create!(
#    email: "staumont.elodie@icloud.com",
#    password: "Bossanova1",


#)
#  prof = Profile.create!(
#    first_name: "Elodie",
#    last_name: "STAUMONT",
#    job: "Chirurgien dentiste",
#    phone_number: "0687107748",
#    birthday: "17/07/1979",
#    city: "Hardelot",
#    pseudo: "Elegrine",
#    statut: "yes",
#    admin: "yes",
#    biography: "",
#    user_id: user.id,
#  )
result = []
@users = User.all
@users.each do |user|
  until result.include?(user.email)
    SubscribeToNewsletterService.new(user).call
    result << user.email
  end
end

