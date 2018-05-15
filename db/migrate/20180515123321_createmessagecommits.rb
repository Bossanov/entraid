class Createmessagecommits < ActiveRecord::Migration[5.1]
  def change
    create_table :messagecommits do |t|
      t.text :content, null: false
      t.string :autor, null: false
      t.string :statut
      t.string :statut, default: "no"
      t.timestamps
    end
  end
end
