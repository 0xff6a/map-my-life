class Workout < ActiveRecord::Base

  INTENSITIES = %w(bruce lee high medium low)
  METRICS     = %w(min/km min/mile)

  has_and_belongs_to_many :targets

  validates :activity,  presence:     { message: Proc.new{ presence_msg(:activity)  } }
  
  validates :date,      presence:     { message: Proc.new{ presence_msg(:date)      } }
  
  validates :duration,  presence:     { message: Proc.new{ presence_msg(:duration)  } }
  validates :duration,  numericality: { message: Proc.new{ duration_numeric_msg     } }
  
  validates :intensity, presence:     { message: Proc.new{ presence_msg(:intensity) } }
  validates :intensity, inclusion:    { in: INTENSITIES , 
                                        message: Proc.new{ intensity_content_msg    } },
                                        allow_nil: true

  validate  :paced_attributes              

  validates :pace_metric, inclusion:  { in: METRICS , 
                                        message: Proc.new{ metric_content_msg       } },
                                        allow_nil: true

  def flash_error
    errors.messages.map{ |msg_key, msg_val| "Error: #{msg_val.join(',')}\n" }.join('')
  end

  def paced_attributes
    if pace.present?
      errors.add(:pace_metric,     Proc.new{ pace_child_presence_msg(:metric) }) if !pace_metric.present?
      errors.add(:distance,        Proc.new{ pace_child_presence_msg(:distance) }) if !distance.present?
      errors.add(:distance_metric, Proc.new{ pace_child_presence_msg(:distance_metric) }) if !distance_metric.present?
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

    def presence_msg(attribute)
      'a workout must have ' + indefinite_articlerize(attribute.to_s)
    end

    def duration_numeric_msg
      'duration must be a number'
    end

    def intensity_content_msg
      'intensity must be one of bruce lee, high, medium, low'
    end

    def metric_content_msg
      'metric must be either min/km or min/mile'
    end

    def indefinite_articlerize(params_word)
      %w(a e i o u).include?(params_word[0].downcase) ? "an #{params_word}" : "a #{params_word}"
    end

  end

  private

  def pace_child_presence_msg(child)
    'a paced workout must have a ' + child.to_s.gsub('_',' ')
  end

end
