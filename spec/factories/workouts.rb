# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workout do
    type "MyText"
    date "MyString"
    duration "9.99"
    intensity "MyString"
  end
end
