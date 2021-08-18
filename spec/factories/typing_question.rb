# frozen_string_literal: true

FactoryBot.define do
  factory :typing_question do
    association :typing_chapter
    body { 'body' }
    typing_body { 'body' }
  end
end
