require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TargetsHelper. For example:
#
# describe TargetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, :type => :helper do
  
  context '#minutize' do
    
    it 'should return N/A unless passed a number' do
      expect(minutize('xyz')).to eq 'N/A'
    end

    it 'should return a number to exactly 2 decimal places' do
      expect(minutize(4)).to eq '4.00'
    end

    it 'should convert the decimal part to a number of seconds' do
      expect(minutize(4.25)).to eq '4.15'
    end



  end

  context '#format_pct' do

    it 'should return N/A unless passed a number' do
      expect(format_pct('xyz')).to eq 'N/A'
    end

    it 'should return a formatted % if passed a number' do
      expect(format_pct(99.5)).to eq '99.50%'
    end

  end

end
