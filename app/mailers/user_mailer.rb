class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Bienvenue sur Medentraid')
    # This will render a view in `app/views/user_mailer`!
  end

  def notification(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.dest, subject: 'Médentraid : Vous avez reçu un message ! ')

  end

def notificationcommit(user)
    @user = user  # Instance variable => available in view

    mail(to: @user, subject: 'Médentraid : Vous avez reçu un message ! ')

  end



end
