# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :target do
    pace "4.15"
    pace_metric "min/km"
    distance "5"
    distance_metric "km"
    due_date Time.now + 60*60*24
  end
end
