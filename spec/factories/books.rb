FactoryBot.define do
  factory :book do
    title { 'book' }
    description { 'book desc' }
    author { 'book author' }
    picture { Rack::Test::UploadedFile.new('spec/fixtures/files/dummy.png') }
    
    trait :other_title do
      title { 'other title' }
    end
  end
end
