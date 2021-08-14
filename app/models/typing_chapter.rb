class TypingChapter < ApplicationRecord
  belongs_to :book
  has_many :typing_questions
end
