FactoryBot.define do
  factory :typing_chapter do
    association :book
    key { 'key' }
    title { 'タイトル' }
  end
end
