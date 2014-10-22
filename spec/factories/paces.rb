# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :pace do
    name            'easy'
    description     'an easier pace'
    multiplier_vo2   0.7
  end

end
