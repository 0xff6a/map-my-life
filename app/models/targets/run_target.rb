class RunTarget < Target

  validates :pace,            presence:     { message: Proc.new{ presence_msg(:pace)            } }
  validates :pace,            numericality: { message: Proc.new{ numeric_msg(:pace)             } }

  validates :pace_metric,     presence:     { message: Proc.new{ presence_msg(:pace_metric)     } }
  validates :pace_metric,     inclusion:    { in: ApplicationSettings.config['pace_metrics'], 
                                              message: Proc.new{ metric_content_msg(:pace)      } },
                                              allow_nil: true

  validates :distance,        presence:     { message: Proc.new{ presence_msg(:distance)        } }                                        
  validates :distance,        numericality: { message: Proc.new{ numeric_msg(:distance)         } }

  validates :distance_metric, presence:     { message: Proc.new{ presence_msg(:distance_metric) } }
  validates :distance_metric, inclusion:    { in: ApplicationSettings.config['distance_metrics'], 
                                              message: Proc.new{ metric_content_msg(:distance)  } },
                                              allow_nil: true

  def description
    id.to_s + ' ' + distance.to_s + distance_metric + ' at ' + pace.to_s + pace_metric 
  end

  def pct_achieved
    workouts.map{ |workout| RunAnalyzer.pct_difference(self, workout) }.max
  end

end
