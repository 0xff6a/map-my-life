require 'rails_helper'

describe RunAnalyzer do
  
  let(:workout) { FactoryGirl.create(:run, distance: 5, pace: 4.00, duration: 20) }
  let(:target)  { FactoryGirl.create(:run_target, distance: 5, pace: 4.00)  }

  before(:each) { RunAnalyzer.benchmark = workout }

  context 'equal distance comparison' do

    it 'should return 100% if the target has been met' do
      expect(RunAnalyzer.pct_difference(target, workout)).to eq 100
    end

    it 'should return 100% if the target has been exceeded' do
      best = FactoryGirl.create(:run, distance: 5, duration: 17.5)
      expect(RunAnalyzer.pct_difference(target, best)).to eq 100
    end

    it 'should return the % difference if the target has not been met' do
      slow = FactoryGirl.create(:run, distance: 5, duration: 25)
      expect(RunAnalyzer.pct_difference(target, slow)).to eq 80
    end

  end

  context 'VO2 Max benchmark' do

    it 'a benchmark can be added' do
      expect(RunAnalyzer.benchmark).to eq workout
    end

    it 'can calculate a VO2 Max from the benchmark' do
      RunAnalyzer.benchmark = workout
      expect(RunAnalyzer.benchmark_vo2_max.round(2)).to eq 49.81
    end

  end

  context 'unequal distance comparison' do

    it 'should get a predicted runtime for a given distance from benchmark' do
      expect(RunAnalyzer.predicted_time(10.0).round(2)).to eq 41.46
    end

    it 'should return the % difference between the target and predicted run time of same distance' do
      long = FactoryGirl.create(:run, distance: 10, duration: 44)
      expect(RunAnalyzer.pct_difference(target, long)).to eq 90.91
    end

  end

  context 'Training paces' do

    let(:paces) { RunAnalyzer.training_paces }

    it 'should return the easy run pace' do
      expect(paces[:easy].round(2)).to eq 5.14
    end

  end

end