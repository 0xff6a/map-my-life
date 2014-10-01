# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workout do
    activity "activity"
    date "12/10/2014"
    duration "60"
    intensity "high"
    pace "4.15"
    pace_metric "min/km"
    distance "5"
    distance_metric "km"
  end
end
