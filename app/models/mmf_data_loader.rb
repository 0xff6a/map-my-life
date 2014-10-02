class MMFDataLoader

  attr_reader :client

  VALID_FORMATS = [ :raw, :params, :object]
  
  ACTIVITY_IDS  = { 
                    '16' => 'Running'      
                  }

  def initialize
    @client = Mmf::Client.new do |config|
      config.client_key    = Rails.application.secrets.mmf_key
      config.client_secret = Rails.application.secrets.mmf_secret
      config.access_token  = Rails.application.secrets.mmf_access_token
    end
  end

  def my_workouts(format = :raw)
    raw_workouts
  end

  def raw_workouts
    client.workouts(user: client.me['id'])
  end

  private

  def activity(raw_workout)
    ACTIVITY_IDS[raw_workout['activity_type']['id']]
  end

  def duration(raw_workout)
    raw_workout['aggregates']['active_time_total'].to_i * seconds_to_min
  end

  def pace(raw_workout)
    raw_workout['aggregates']['speed_avg'].to_i * ms_to_min_km
  end

  def seconds_to_min
    1 / 60
  end

  def ms_to_min_km

  end

end

=begin
Measurement Type  Unit Value
Distance  meters
Speed meters/second
Elevation meters
Angle (earth) degrees
Heart Rate  beats/minute
Cadence revolutions/minute
Power watts
Temperature celcius
Date-Time RFC
=end