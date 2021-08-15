class TypingQuestion < ApplicationRecord
  belongs_to :typing_chapter

  validates :body, presence: true
  validates :typing_body, presence: true, format: { with: /\A[0-9a-zA-Z]+\z/ }
end
