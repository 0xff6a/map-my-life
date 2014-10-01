require 'rails_helper'

RSpec.describe Workout, :type => :model do
  
  it 'should not be valid without an activity' do
    workout = Workout.new(date: '10/12/2014', duration: 60, intensity: 'high') 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:activity]).to include('a workout must have an activity')
  end

  it 'should not be valid without a date' do
    workout = Workout.new(activity: 'Running', duration: 60, intensity: 'high') 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:date]).to include('a workout must have a date')
  end

  it 'should not be valid without a duration' do
    workout = Workout.new(activity: 'Running', date: '10/12/2014', intensity: 'high') 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:duration]).to include('a workout must have a duration')
  end

  it 'the duration must be numeric' do
    workout = Workout.new(activity: 'Running', 
                          date: '10/12/2014', 
                          duration: 'xyz', 
                          intensity: 'high') 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:duration]).to include('duration must be a number')
  end

  it 'should not be valid without an intensity' do
    workout = Workout.new(activity: 'Running', 
                          date: '10/12/2014', 
                          duration: 'xyz') 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:intensity]).to include('a workout must have an intensity')
  end

  it 'the intensity must be either bruce lee, high, medium, low' do
    workout = Workout.new(activity: 'Running', 
                          date: '10/12/2014', 
                          duration: 35, 
                          intensity: 'blah') 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:intensity]).to include('intensity must be one of bruce lee, high, medium, low')
  end

  it 'the metric must be either min/km or min/mile' do
    workout = Workout.new(activity: 'Running', 
                          date: '10/12/2014', 
                          duration: 35, 
                          intensity: 'high', 
                          pace: 4, 
                          pace_metric: 'hi') 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:pace_metric]).to include('metric must be either min/km or min/mile')
  end

  it 'if a workout has a pace it must have a metric' do
    workout = Workout.new(activity: 'Running', 
                          date: '10/12/2014', 
                          duration: 35, 
                          intensity: 'high', 
                          pace: 4) 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:pace_metric]).to include('a paced workout must have a metric')
  end

  it 'if a workout has a pace it must have a distance' do
    workout = Workout.new(activity: 'Running', 
                          date: '10/12/2014', 
                          duration: 35, 
                          intensity: 'high', 
                          pace: 4, 
                          pace_metric: 'min/km') 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:distance]).to include('a paced workout must have a distance')
  end

  it 'if a workout has a distance it must have a distance metric' do
    workout = Workout.new(activity: 'Running', 
                          date: '10/12/2014', 
                          duration: 35, 
                          intensity: 'high', 
                          pace: 4, 
                          pace_metric: 'min/km', 
                          distance: 5.0) 
    expect(workout).not_to be_valid
    expect(workout.errors.messages[:distance_metric]).to include('a paced workout must have a distance metric')
  end

end
