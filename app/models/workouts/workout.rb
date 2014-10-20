class Workout < ActiveRecord::Base

  extend ValidationMessages

  INTENSITIES = %w(bruce lee high medium low)

  has_and_belongs_to_many :targets

  validates :activity,  presence:     { message: Proc.new{ presence_msg(:activity)  } }
  
  validates :date,      presence:     { message: Proc.new{ presence_msg(:date)      } }
  
  validates :duration,  presence:     { message: Proc.new{ presence_msg(:duration)  } }
  validates :duration,  numericality: { message: Proc.new{ numeric_msg(:duration)   } }
  
  validates :intensity, presence:     { message: Proc.new{ presence_msg(:intensity) } }
  validates :intensity, inclusion:    { in: INTENSITIES , 
                                        message: Proc.new{ intensity_content_msg    } },
                                        allow_nil: true

end
