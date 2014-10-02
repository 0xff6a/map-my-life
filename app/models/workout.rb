class Workout < ActiveRecord::Base

  INTENSITIES = %w(bruce lee high medium low)
  METRICS     = %w(min/km min/mile)

  has_and_belongs_to_many :targets

  validates :activity,  presence:     { message: 'a workout must have an activity' }
  
  validates :date,      presence:     { message: 'a workout must have a date' }
  
  validates :duration,  presence:     { message: 'a workout must have a duration' }
  validates :duration,  numericality: { message: 'duration must be a number' }
  
  validates :intensity, presence:     { message: 'a workout must have an intensity' }
  validates :intensity, inclusion:    { in: INTENSITIES , 
                                        message: 'intensity must be one of bruce lee, high, medium, low' },
                                        allow_nil: true

  validate  :paced_attributes              

  validates :pace_metric, inclusion:  { in: METRICS , 
                                        message: 'metric must be either min/km or min/mile' },
                                        allow_nil: true

  def flash_error
    errors.messages.map{ |msg_key, msg_val| "Error: #{msg_val.join(',')}\n" }.join('')
  end

  def paced_attributes
    if pace.present?
      errors.add(:pace_metric, 'a paced workout must have a metric') if !pace_metric.present?
      errors.add(:distance, 'a paced workout must have a distance') if !distance.present?
      errors.add(:distance_metric, 'a paced workout must have a distance metric') if !distance_metric.present?
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
        :pace_metric,
        :distance,
        :distance_metric
      ]
    end

  end

end
