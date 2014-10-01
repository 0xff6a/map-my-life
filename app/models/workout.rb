class Workout < ActiveRecord::Base

  INTENSITY = %w(bruce lee high medium low)

  validates :activity,  presence:     { message: 'a workout must have an activity' }
  
  validates :date,      presence:     { message: 'a workout must have a date' }
  
  validates :duration,  presence:     { message: 'a workout must have a duration' }
  validates :duration,  numericality: { message: 'duration must be a number' }
  
  validates :intensity, presence:     { message: 'a workout must have an intensity' }
  validates :intensity, inclusion:    { in: INTENSITY , message: 'intensity must be one of bruce lee, high, medium, low' }

  def flash_error
    errors.messages.map{ |msg_key, msg_val| "Error: #{msg_val.join(',')}\n" }.join('')
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
        :intensity
      ]
    end

  end

end
