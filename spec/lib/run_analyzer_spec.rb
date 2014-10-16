require 'rails_helper'

describe RunAnalyzer do
  
  let(:workout) { FactoryGirl.create(:workout, distance: 5, pace: 4.00, duration: 20) }
  let(:target)  { FactoryGirl.create(:target, distance: 5, pace: 4.00)  }

  context 'equal distance comparison' do

    it 'should return 100% if the target has been met' do
      expect(RunAnalyzer.pct_difference(target, workout)).to eq 100
    end

    it 'should return 100% if the target has been exceeded' do
      best = FactoryGirl.create(:workout, distance: 5, pace: 3.5)
      expect(RunAnalyzer.pct_difference(target, best)).to eq 100
    end

    it 'should return the % difference if the target has not been met' do
      slow = FactoryGirl.create(:workout, distance: 5, pace: 5)
      expect(RunAnalyzer.pct_difference(target, slow)).to eq 80
    end

  end

  context 'VO2 Max benchmark' do

    it 'should not have a benchmark intially' do
      expect(RunAnalyzer.benchmark).to be nil
    end

    it 'a benchmark can be added' do
      RunAnalyzer.benchmark = workout
      expect(RunAnalyzer.benchmark).to eq workout
    end

    it 'can calculate a VO2 Max from the benchmark' do
      RunAnalyzer.benchmark = workout
      expect(RunAnalyzer.benchmark_vo2_max.round(2)).to eq 49.81
    end

  end

  context 'unequal distance comparison' do

    before(:each) { RunAnalyzer.benchmark = workout }

    it 'should get a predicted runtime for a given distance from benchmark' do
      expect(RunAnalyzer.predicted_time(10.0)).to eq 45
    end

  end

end