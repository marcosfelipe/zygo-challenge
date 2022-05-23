FactoryBot.define do
  factory :user do
    id {1}
    email { 'test@test.com' }
    password { 'test123' }
  end
end
