class Article < ApplicationRecord
  belongs_to :profile
  has_many :articlecommits, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
