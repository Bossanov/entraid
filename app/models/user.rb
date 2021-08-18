class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
  after_create :subscribe_to_newsletter

  # after_create :send_welcome_email

  private

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call

  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end



end
