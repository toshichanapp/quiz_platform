class CreateTypingChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :typing_chapters do |t|
      t.references :book
      t.string :title
      t.string :key
      t.timestamps
    end
  end
end
