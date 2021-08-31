class Conversation < ApplicationRecord
  belongs_to :profile
  has_many :conversationcommits, dependent: :destroy



end
