class Createmessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.text :category, null: false
      t.string :statut, default: "no"
      t.timestamps
    end
  end
end
