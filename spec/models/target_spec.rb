require 'rails_helper'

RSpec.describe Target, :type => :model do

  context 'validations' do

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

    it 'should be valid with a due date' do
      target = FactoryGirl.build(:target)
      expect(target).to be_valid
    end

  end

  def _one_day_ago
    Time.now - (60*60*24)
  end

end
