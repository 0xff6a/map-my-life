class Run < Workout

  validates :pace,  presence:             { message: Proc.new{ presence_msg(:pace)            } }
  validates :pace,  numericality:         { message: Proc.new{ numeric_msg(:pace)             } }

  validates :distance,  presence:         { message: Proc.new{ presence_msg(:distance)        } }
  validates :distance,  numericality:     { message: Proc.new{ numeric_msg(:distance)         } }

  validates :pace_metric, presence:       { message: Proc.new{ presence_msg(:pace_metric)     } }            
  validates :pace_metric, inclusion:      { in: ApplicationSettings.config['pace_metrics'] , 
                                            message: Proc.new{ metric_content_msg(:pace)      } }

  validates :distance_metric, presence:   { message: Proc.new{ presence_msg(:distance_metric) } }            
  validates :distance_metric, inclusion:  { in: ApplicationSettings.config['distance_metrics'] , 
                                            message: Proc.new{ metric_content_msg(:distance)  } }                                      
                                   

  def flash_error
    errors.messages.map{ |msg_key, msg_val| "Error: #{msg_val.join(',')}\n" }.join('')
  end


end