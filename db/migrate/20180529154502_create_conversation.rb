class CreateConversation < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.string :content
      t.string :autor
      t.string :dest
      t.timestamps
    end
    create_table :conversationcommits do |t|
      t.string :content
      t.timestamps
    end
  end
end
