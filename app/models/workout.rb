class Workout < ActiveRecord::Base

  INTENSITIES = %w(bruce lee high medium low)
  METRICS     = %w(min/km min/mile)

  validates :activity,  presence:     { message: 'a workout must have an activity' }
  
  validates :date,      presence:     { message: 'a workout must have a date' }
  
  validates :duration,  presence:     { message: 'a workout must have a duration' }
  validates :duration,  numericality: { message: 'duration must be a number' }
  
  validates :intensity, presence:     { message: 'a workout must have an intensity' }
  validates :intensity, inclusion:    { in: INTENSITIES , message: 'intensity must be one of bruce lee, high, medium, low' }

  validate :if_paced_has_metric,        message: 'a paced workout must have a metric' 
  validates :metric, inclusion:       { in: METRICS , message: 'metric must be either min/km or min/mile' }

  def flash_error
    errors.messages.map{ |msg_key, msg_val| "Error: #{msg_val.join(',')}\n" }.join('')
  end

  def if_paced_has_metric
    if pace.present? && !metric.present?
      errors.add(:metric, 'a paced workout must have a metric' ) 
    end
  end

  class << self

    def create_from(params)
      create(params[:workout].permit(attributes))
    end

    def update_from(params)
      find(params[:id]).update(params[:workout].permit(attributes))
    end

    private

    def attributes
      [
        :activity, 
        :date, 
        :duration, 
        :intensity,
        :pace,
        :metric
      ]
    end

  end

end
