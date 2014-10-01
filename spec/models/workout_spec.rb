require 'rails_helper'

RSpec.describe Workout, :type => :model do

  context 'validations' do
  
    it 'should not be valid without an activity' do
      workout = FactoryGirl.build(:workout, activity: nil)
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:activity]).to include(
          'a workout must have an activity')
    end

    it 'should not be valid without a date' do
      workout = FactoryGirl.build(:workout, date: nil)
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:date]).to include(
          'a workout must have a date')
    end

    it 'should not be valid without a duration' do
      workout = FactoryGirl.build(:workout, duration: nil)
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:duration]).to include(
          'a workout must have a duration')
    end

    it 'the duration must be numeric' do
      workout = FactoryGirl.build(:workout, duration: 'xyz')
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:duration]).to include(
          'duration must be a number')
    end

    it 'should not be valid without an intensity' do
      workout = FactoryGirl.build(:workout, intensity: nil)
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:intensity]).to include(
          'a workout must have an intensity')
    end

    it 'the intensity must be either bruce lee, high, medium, low' do
      workout = FactoryGirl.build(:workout, intensity: 'blah')
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:intensity]).to include(
          'intensity must be one of bruce lee, high, medium, low')
    end

    it 'the pace metric must be either min/km or min/mile' do
      workout = FactoryGirl.build(:workout, pace_metric: 'xyz')
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:pace_metric]).to include(
          'metric must be either min/km or min/mile')
    end

    it 'if a workout has a pace it must have a metric' do
      workout = FactoryGirl.build(:workout, pace_metric: nil)
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:pace_metric]).to include(
          'a paced workout must have a metric')
    end

    it 'if a workout has a pace it must have a distance' do
      workout = FactoryGirl.build(:workout, distance: nil)
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:distance]).to include(
          'a paced workout must have a distance')
    end

    it 'if a workout has a distance it must have a distance metric' do
      workout = FactoryGirl.build(:workout, distance_metric: nil)
      expect(workout).not_to be_valid
      expect(workout.errors.messages[:distance_metric]).to include(
          'a paced workout must have a distance metric')
    end

    it 'should be valid with an activity, date, duration, intensity' do
      workout = FactoryGirl.build(:basic_workout)
      expect(workout).to be_valid
    end

    it 'should be valid with an activity, date, duration, intensity, pace, distance and metrics' do
      workout = FactoryGirl.build(:workout)
      expect(workout).to be_valid
    end

  end

end
