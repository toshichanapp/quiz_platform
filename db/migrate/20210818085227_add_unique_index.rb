class AddUniqueIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :books, :key, unique: true
    add_index :typing_chapters, [:key, :book_id], unique: true
  end
end
