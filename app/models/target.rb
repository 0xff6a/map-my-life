class Target < ActiveRecord::Base

  PACE_METRICS     = %w(min/km min/mile)
  DISTANCE_METRICS = %w(km mile)

  belongs_to :workout

  validates :workout_id,      presence:     { message: 'a target must be assigned a workout' }
  
  validates :pace,            presence:     { message: 'a target must have a pace' }
  validates :pace,            numericality: { message: 'the pace must be numeric' }

  validates :pace_metric,     presence:     { message: 'a pace must have a metric' }
  validates :pace_metric,     inclusion:    { in: PACE_METRICS , 
                                              message: 'metric must be either min/km or min/mile' },
                                              allow_nil: true

  validates :distance,        presence:     { message: 'a target must have a distance' }                                        
  validates :distance,        numericality: { message: 'distance must be numeric' }

  validates :distance_metric, presence:     { message: 'a distance must have a metric' }
  validates :distance_metric, inclusion:    { in: DISTANCE_METRICS , 
                                              message: 'metric must be either min/km or min/mile' },
                                              allow_nil: true

  validates :due_date,        presence:     { message: 'a target must have a due date'} 
  validate  :future_due_date?

  def future_due_date?
    errors.add(:due_date, 'due date must be in the future') if due_date.present? && due_date < Time.now 
  end

  def flash_error
    errors.messages.map{ |msg_key, msg_val| "Error: #{msg_val.join(',')}\n" }.join('')
  end

  class << self

    def create_from(params)
      create(params[:target].permit(attributes))
    end

    private

    def attributes
      [
        :pace, 
        :pace_metric, 
        :distance, 
        :distance_metric, 
        :due_date
      ]
    end

  end

  private



end
