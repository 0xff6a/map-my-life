require 'rails_helper'

RSpec.describe RunTarget, :type => :model do
  
  context 'validations' do

    it 'should not be valid without a pace' do
      target = FactoryGirl.build(:run_target, pace: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:pace]).to include(
          'a runtarget must have a pace')
    end

    it 'should have a numeric pace' do
      target = FactoryGirl.build(:run_target, pace: 'xyz')
      expect(target).not_to be_valid
      expect(target.errors.messages[:pace]).to include(
          'pace must be a number')
    end

    it 'should not be valid without a pace metric' do
      target = FactoryGirl.build(:run_target, pace_metric: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:pace_metric]).to include(
          'a runtarget must have a pace metric')
    end

    it 'should not be valid without a pace metric' do
      target = FactoryGirl.build(:run_target, pace_metric: 'xyz')
      expect(target).not_to be_valid
      expect(target.errors.messages[:pace_metric]).to include(
          'metric must be either min/km or min/mile')
    end

    it 'should not be valid without a distance' do
      target = FactoryGirl.build(:run_target, distance: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:distance]).to include(
          'a runtarget must have a distance')
    end

    it 'should have a numeric distance' do
      target = FactoryGirl.build(:run_target, distance: 'xyz')
      expect(target).not_to be_valid
      expect(target.errors.messages[:distance]).to include(
          'distance must be a number')
    end

    it 'should not be valid without a distance metric' do
      target = FactoryGirl.build(:run_target, distance_metric: nil)
      expect(target).not_to be_valid
      expect(target.errors.messages[:distance_metric]).to include(
          'a runtarget must have a distance metric')
    end

  end

end
