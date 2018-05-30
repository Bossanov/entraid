class AddReferenceToConversations < ActiveRecord::Migration[5.1]
  def change
    add_reference :conversations, :profile, foreign_key: true, index: true
    add_reference :conversationcommits, :conversation, foreign_key: true, index: true

  end
end
