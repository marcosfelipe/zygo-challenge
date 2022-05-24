FactoryBot.define do
  factory :book do
    title { 'book' }
    description { 'book desc' }
    author { 'book author' }
    picture { Rack::Test::UploadedFile.new('spec/fixtures/files/dummy.png') }
  end
end
