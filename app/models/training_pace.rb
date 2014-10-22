class TrainingPace < ActiveRecord::Base

  extend ValidationMessages

  validates :name,            presence: { message: Proc.new{ presence_msg(:name)            } }
  validates :description,     presence: { message: Proc.new{ presence_msg(:description)     } }
  validates :multiplier_vo2,  presence: { message: Proc.new{ presence_msg(:multiplier_vo2)  } }

  def self.set_training_paces_using(analyzer)
    self.all.each{ |entry| entry.update(pace: analyzer.pace_from_pct_vo2max(entry.multiplier_vo2)) }
  end

end
