class Createarticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :photo
      t.string :statut, default: "no"
      t.string :theme
      t.timestamps
    end
  end
end
