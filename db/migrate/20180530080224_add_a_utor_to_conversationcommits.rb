class AddAUtorToConversationcommits < ActiveRecord::Migration[5.1]
  def change
    add_column :conversationcommits, :autor, :string

  end
end
