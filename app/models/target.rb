class Target < ActiveRecord::Base

  extend ValidationMessages

  PACE_METRICS     = %w(min/km min/mile)
  DISTANCE_METRICS = %w(km mile)

  has_and_belongs_to_many :workouts
  
  validates :pace,            presence:     { message: Proc.new{ presence_msg(:pace)            } }
  validates :pace,            numericality: { message: Proc.new{ numeric_msg(:pace)             } }

  validates :pace_metric,     presence:     { message: Proc.new{ presence_msg(:pace_metric)     } }
  validates :pace_metric,     inclusion:    { in: PACE_METRICS , 
                                              message: Proc.new{ metric_content_msg(:pace)      } },
                                              allow_nil: true

  validates :distance,        presence:     { message: Proc.new{ presence_msg(:distance)        } }                                        
  validates :distance,        numericality: { message: Proc.new{ numeric_msg(:distance)         } }

  validates :distance_metric, presence:     { message: Proc.new{ presence_msg(:distance_metric) } }
  validates :distance_metric, inclusion:    { in: DISTANCE_METRICS , 
                                              message: Proc.new{ metric_content_msg(:distance)  } },
                                              allow_nil: true

  validates :due_date,        presence:     { message: Proc.new{ presence_msg(:due_date)        } } 
  validate  :future_due_date?

  def future_due_date?
    errors.add(:due_date, 'due date must be in the future') if due_date.present? && due_date < Time.now 
  end

  def flash_error
    errors.messages.map{ |msg_key, msg_val| "Error: #{msg_val.join(',')}\n" }.join('')
  end

  def description
    id.to_s + ' ' + distance.to_s + distance_metric + ' at ' + pace.to_s + pace_metric 
  end

  class << self

    def create_from(params)
      create(params[:target].permit(attributes))
    end

    def link_workout(params)
      find(params[:workout][:targets]).workouts << Workout.find(params[:id])
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
