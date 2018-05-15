class Message < ApplicationRecord
  belongs_to :profile
  has_many :messagecommits, dependent: :destroy
end

