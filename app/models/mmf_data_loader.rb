class MMFDataLoader

  attr_reader :client

  VALID_FORMATS = [ :raw, :params, :object]
  
  ACTIVITIES    = { 
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
    eval(format.to_s + '_workouts') if valid?(format)
  end

  private

  def raw_workouts
    client.workouts(user: client.me['id'])
  end

  def params_workouts
    raw_workouts.map do |raw|
      {
        activity:         activity_from(raw),
        date:             date_from(raw),
        duration:         duration_from(raw),
        intensity:        intensity_from(raw),
        pace:             pace_from(raw),
        pace_metric:     'min/km',
        distance:         distance_from(raw),
        distance_metric: 'km'
      }
    end
  end

  def object_workouts
    params_workouts.map{ |params| Workout.create(params) }
  end

  def activity_from(raw_workout)
    ACTIVITIES[raw_workout['_links']['activity_type'][0]['id']]
  end

  def date_from(raw_workout)
    Time.parse(raw_workout['start_datetime']).strftime("%Y-%m-%d")
  end

  def duration_from(raw_workout)
    seconds_to_min(raw_workout['aggregates']['active_time_total'])
  end

  def intensity_from(raw_workout)
    'medium'
  end

  def pace_from(raw_workout)
    ms_to_min_km(raw_workout['aggregates']['speed_avg'])
  end

  def distance_from(raw_workout)
    m_to_km(raw_workout['aggregates']['distance_total'])
  end

  def seconds_to_min(value)
    value.to_f / 60
  end

  def ms_to_min_km(value)
    raw = (1000 / ( 60.0 * value.to_f + epsilon))
    raw.floor + (raw - raw.floor) * 0.6
  end

  def m_to_km(value)
    value.to_f / 1000
  end

  def epsilon
    0.001
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