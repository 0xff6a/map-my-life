require 'rails_helper'

RSpec.describe Target, :type => :model do

  context 'validations' do
    
    it 'must belong to a workout' do
      target = FactoryGirl.build(:target, workout_id: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:workout_id]).to include(
          'a target must be assigned a workout')
    end

    it 'should not be valid without a pace' do
      target = FactoryGirl.build(:target, pace: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:pace]).to include(
          'a target must have a pace')
    end

    it 'should have a numeric pace' do
      target = FactoryGirl.build(:target, pace: 'xyz')
      expect(target).not_to be_valid
      expect(target.errors.messages[:pace]).to include(
          'the pace must be numeric')
    end

    it 'should not be valid without a pace metric' do
      target = FactoryGirl.build(:target, pace_metric: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:pace_metric]).to include(
          'a pace must have a metric')
    end

    it 'should not be valid without a pace metric' do
      target = FactoryGirl.build(:target, pace_metric: 'xyz')
      expect(target).not_to be_valid
      expect(target.errors.messages[:pace_metric]).to include(
          'metric must be either min/km or min/mile')
    end

    it 'should not be valid without a distance' do
      target = FactoryGirl.build(:target, distance: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:distance]).to include(
          'a target must have a distance')
    end

    it 'should have a numeric distance' do
      target = FactoryGirl.build(:target, distance: 'xyz')
      expect(target).not_to be_valid
      expect(target.errors.messages[:distance]).to include(
          'distance must be numeric')
    end

    it 'should not be valid without a distance metric' do
      target = FactoryGirl.build(:target, distance_metric: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:distance_metric]).to include(
          'a distance must have a metric')
    end

    it 'should not be valid without a due date' do
      target = FactoryGirl.build(:target, due_date: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:due_date]).to include(
          'a target must have a due date')
    end

    it 'should have a due date in the future' do
      target = FactoryGirl.build(:target, due_date: _one_day_ago)
      expect(target).not_to be_valid
      expect(target.errors.messages[:due_date]).to include(
          'due date must be in the future')
    end

    it 'should be valid with pace, distance, metric, due date and a workout' do
      target = FactoryGirl.build(:target)
      expect(target).to be_valid
    end

  end

  def _one_day_ago
    Time.now - (60*60*24)
  end

end
