class RunAnalyzer

  class << self

    def pct_difference(target, workout)
      [1, (target.pace / workout.pace)].min * 100
    end

  end

end