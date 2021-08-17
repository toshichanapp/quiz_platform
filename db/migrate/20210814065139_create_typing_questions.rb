# frozen_string_literal: true

class CreateTypingQuestions < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :typing_questions, id: :uuid do |t|
      t.references :typing_chapter
      t.string :body
      t.string :typing_body
      t.timestamps
    end
  end
end
