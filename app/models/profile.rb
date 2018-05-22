class Profile < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :messagecommits, through: :messages
  has_many :articlecommits, through: :articles
  mount_uploader :photo, PhotoUploader
end

