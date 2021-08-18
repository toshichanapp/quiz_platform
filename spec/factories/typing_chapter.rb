# frozen_string_literal: true

FactoryBot.define do
  factory :typing_chapter do
    association :book
    key { 'key' }
    title { 'タイトル' }
  end
end
