require 'rails_helper'

describe MMFDataLoader do
  
  let(:loader)  { MMFDataLoader.new   }
  # let(:raw)     { loader.raw_workouts }

  let(:data)    { [{ "start_datetime"=>"2013-12-26T10:46:39+00:00", 
                    "name"=>"Ran 9.74 km on 26/12/2013", 
                    "updated_datetime"=>"2013-12-26T14:07:57+00:00", 
                    "created_datetime"=>"2013-12-26T14:07:57+00:00", 
                    "notes"=>"", "reference_key"=>nil, 
                    "start_locale_timezone"=>"Europe/London", 
                    "source"=>"MapMyRun iPhone", 
                    "_links"=>{"self"=>[{"href"=>"/v7.0/workout/451005329/", 
                    "id"=>"451005329"}], 
                    "route"=>[{"href"=>"/v7.0/route/337996631/", "id"=>"337996631"}], 
                    "activity_type"=>[{"href"=>"/v7.0/activity_type/16/", "id"=>"16"}], 
                    "user"=>[{"href"=>"/v7.0/user/10997814/", "id"=>"10997814"}], 
                    "privacy"=>[{"href"=>"/v7.0/privacy_option/3/", "id"=>"3"}]}, 
                    "has_time_series"=>true, "is_verified"=>true, 
                    "aggregates"=>{"active_time_total"=>3464.0, "distance_total"=>9736.75650816, 
                    "speed_max"=>4.748816512, "steps_total"=>0.0, "speed_avg"=>2.8108042336, 
                    "elapsed_time_total"=>3464.0, "metabolic_energy_total"=>4280232.0}
                }] }

  xcontext 'fetching data' do

    it 'can do retrieve a list of workouts from MMF' do
      workouts = loader.my_workouts(:raw)
      expect(workouts.first.values).to include('Ran 9.74 km on 26/12/2013')
    end

    it 'can create workout parameters from MMF data' do
      workouts = loader.my_workouts(:params) 
      expect(workouts.first.keys).to eq  [:activity, 
                                          :date, 
                                          :duration, 
                                          :intensity,
                                          :pace,
                                          :pace_metric,
                                          :distance,
                                          :distance_metric]
    end

  end

  context 'conversions' do

    before(:each) do
      allow(loader).to receive(:raw_workouts).and_return(data)
    end

    it 'can convert the activity from id to name' do
      expect(loader.my_workouts(:params).first[:activity]).to eq 'Running'
    end

    it 'can get the start date' do
      expect(loader.my_workouts(:params).first[:date]).to eq "2013-12-26"
    end

    it 'can get the duration' do
      expect(loader.my_workouts(:params).first[:duration].to_i).to eq 57
    end

    it 'can get the intensity' do
      expect(loader.my_workouts(:params).first[:intensity]).to eq 'medium'
    end

    it 'can get the pace' do
      expect(loader.my_workouts(:params).first[:pace].round(2)).to eq 5.56
    end

    it 'sets the pace metric to min/km' do
      expect(loader.my_workouts(:params).first[:pace_metric]).to eq 'min/km'
    end

    it 'can get the distance' do
      expect(loader.my_workouts(:params).first[:distance].round(2)).to eq 9.74
    end

    it 'sets the distance metric to km' do
      expect(loader.my_workouts(:params).first[:distance_metric]).to eq 'km'
    end

  end

  context 'creating objects' do

    before(:each) do
      allow(loader).to receive(:raw_workouts).and_return(data)
    end

    it 'can create workouts from MMF data' do
      expect(loader.my_workouts(:object).first).to be_an_instance_of(Workout)
    end

    it 'the workout object created matches the data received' do
      expect(loader.my_workouts(:object).first.distance.round(2)).to eq 9.74
    end

  end
end