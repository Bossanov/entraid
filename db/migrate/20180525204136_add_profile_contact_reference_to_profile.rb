class AddProfileContactReferenceToProfile < ActiveRecord::Migration[5.1]
  def change
    add_reference :contacts, :profile, foreign_key: true, index: true

  end
end
