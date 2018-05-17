class AddProfileReferenceToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :profile, foreign_key: true, index: true
    add_reference :messages, :profile, foreign_key: true, index: true
    add_reference :articlecommits, :article, foreign_key: true, index: true
    add_reference :messagecommits, :message, foreign_key: true, index: true

  end
end
