class MMFDataLoader

  attr_reader :client

  VALID_FORMATS = [ :raw, :params, :object]
  
  ACTIVITY_IDS  = { 
                    '16' => 'Running'      
                  }

  def initialize
    # @client = Mmf::Client.new do |config|
    #   config.client_key    = Rails.application.secrets.mmf_key
    #   config.client_secret = Rails.application.secrets.mmf_secret
    #   config.access_token  = Rails.application.secrets.mmf_access_token
    # end
  end

  def my_workouts(format = :raw)
    eval(format.to_s + '_workouts') if valid?(format)
  end

  private

  def raw_workouts
    client.workouts(user: client.me['id'])
  end

  def params_workouts
    raw = raw_workouts
    {
      activity:         activity_from(raw),
      duration:         duration_from(raw),
      pace:             pace_from(raw),
      pace_metric:     'min/km',
      distance:         distance_from(raw),
      distance_metric: 'km'
    }
  end

  def activity_from(raw_workout)
    ACTIVITY_IDS[raw_workout['_links']['activity_type'][0]['id']]
  end

  def duration_from(raw_workout)
    raw_workout['aggregates']['active_time_total'].to_i * seconds_to_min
  end

  def pace_from(raw_workout)
    ms_to_min_km(raw_workout['aggregates']['speed_avg'].to_f)
  end

  def distance_from(raw_workout)
    raw_workout['aggregates']['distance_total'].to_f * m_to_km
  end

  def seconds_to_min
    ( 1.0 / 60 )
  end

  def ms_to_min_km(value)
    raw = (1000 / ( 60.0 * value))
    raw.floor + (raw - raw.floor) * 0.6
  end

  def m_to_km
    1.0 / 1000
  end

  def valid?(format)
    VALID_FORMATS.include?(format)
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