require 'rails_helper'

RSpec.describe TrainingPace, :type => :model do
 
  context 'validation' do

    it 'should have a name' do
      pace = FactoryGirl.build(:training_pace, name: nil)
      expect(pace).not_to be_valid
      expect(pace.errors.messages[:name]).to include(
          'a trainingpace must have a name')
    end

    it 'should have a description' do
      pace = FactoryGirl.build(:training_pace, description: nil)
      expect(pace).not_to be_valid
      expect(pace.errors.messages[:description]).to include(
          'a trainingpace must have a description')
    end

    it 'should have a VO2 max multiplier' do
      pace = FactoryGirl.build(:training_pace, multiplier_vo2: nil)
      expect(pace).not_to be_valid
      expect(pace.errors.messages[:multiplier_vo2]).to include(
          'a trainingpace must have a multiplier vo2')
    end

    it 'should be valid with a name, description and VO2 max multiplier' do
      pace = FactoryGirl.build(:training_pace)
      expect(pace).to be_valid
    end

  end

  context 'updating training paces' do

    let(:benchmark) { FactoryGirl.create(:run)        }

    before(:each) do
      FactoryGirl.create(:training_pace) 
      RunAnalyzer.benchmark = benchmark
    end

    it 'should update the training pace based on a benchmarked run analyzer' do
      TrainingPace.set_training_paces_using(RunAnalyzer)
      expect(TrainingPace.first.pace.round(2)).to eq 13.6
    end

  end

end
