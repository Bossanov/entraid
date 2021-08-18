class ChangeColumnToConversation < ActiveRecord::Migration[5.1]
  def change
    change_column :conversations, :content, :text
    change_column :conversationcommits, :content, :text


  end
end
