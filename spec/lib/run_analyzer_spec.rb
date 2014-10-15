require 'rails_helper'

describe RunAnalyzer do
  
  let(:workout) { FactoryGirl.create(:workout, distance: 5, pace: 4.00) }
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

end