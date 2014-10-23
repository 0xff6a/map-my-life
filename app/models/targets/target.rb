class Target < ActiveRecord::Base

  extend ValidationMessages

  has_and_belongs_to_many :workouts

  validates :due_date, presence: { message: Proc.new{ presence_msg(:due_date)  } } 
  validate  :future_due_date?

  def future_due_date?
    errors.add(:due_date, 'due date must be in the future') if due_date.present? && due_date < Time.now 
  end

  def flash_error
    errors.messages.map{ |msg_key, msg_val| "Error: #{msg_val.join(',')}\n" }.join('')
  end

  class << self

    def link_workout(params)
      puts 'HELLO'
      puts params[:workout][:targets]
      puts params[:id]
      find(params[:workout][:targets]).workouts << Workout.find(params[:id])
    end

  end

end
