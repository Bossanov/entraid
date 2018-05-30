class Profile < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :messagecommits, through: :messages, dependent: :destroy
  has_many :articlecommits, through: :articles, dependent: :destroy
  has_many :conversationcommits, through: :conversations, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end

