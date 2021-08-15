class TypingChapter < ApplicationRecord
  belongs_to :book
  has_many :typing_questions

  validates :key, presence: true, uniqueness: { scope: :book }, format: { with: /\A[0-9a-z]+\z/ }
end