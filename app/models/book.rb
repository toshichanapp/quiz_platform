# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :typing_chapters, dependent: :nullify

  validates :key, presence: true, uniqueness: true, format: { with: /\A[0-9a-z]+\z/ }
end
