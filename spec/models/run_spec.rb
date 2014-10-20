require 'rails_helper'

RSpec.describe Run, :type => :model do

  it 'it must have a pace' do
    workout = FactoryGirl.build(:run, pace: nil)
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:pace]).to include(
        'a run must have a pace')
  end

  it 'should have a numeric pace' do
    target = FactoryGirl.build(:run, pace: 'xyz')
    expect(target).not_to be_valid
    expect(target.errors.messages[:pace]).to include(
        'pace must be a number')
  end
  
  it 'must have a pace metric' do
    workout = FactoryGirl.build(:run, pace_metric: nil)
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:pace_metric]).to include(
        'a run must have a pace metric')
  end

  it 'the pace metric must be either min/km or min/mile' do
    workout = FactoryGirl.build(:run, pace_metric: 'xyz')
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:pace_metric]).to include(
        'metric must be either min/km or min/mile')
  end

  it 'it must have a distance' do
    workout = FactoryGirl.build(:run, distance: nil)
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:distance]).to include(
        'a run must have a distance')
  end

  it 'should have a numeric distance' do
    target = FactoryGirl.build(:run, distance: 'xyz')
    expect(target).not_to be_valid
    expect(target.errors.messages[:distance]).to include(
        'distance must be a number')
  end

  it 'it must have a distance metric' do
    workout = FactoryGirl.build(:run, distance_metric: nil)
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:distance_metric]).to include(
        'a run must have a distance metric')
  end

  it 'should be valid with an activity, date, duration, intensity, pace, distance and metrics' do
    workout = FactoryGirl.build(:run)
    expect(workout).to be_valid
  end

end
