class RunAnalyzer

  TIME_THRESHOLD = 0.0001
  T_MIN          = 1
  T_MAX          = 1000 

  class << self

    @benchmark = nil

    attr_accessor :benchmark

    def pct_difference(target, workout)
      @benchmark = workout
      [1, (target.pace / predicted_pace(workout.distance))].min.round(4) * 100
    end

    def predicted_pace(distance)
      predicted_time(distance) / distance
    end

    def predicted_time(distance, t_min = T_MIN, t_max = T_MAX)
      guess = 0.5 * (t_min + t_max)
      diff = benchmark_vo2_max - vo2_max(distance, guess)
      return guess if diff.abs < TIME_THRESHOLD
      diff > 0 ? predicted_time(distance, t_min , guess) : predicted_time(distance, guess, t_max)
    end

    def vo2_max(distance, time)
      vo2(speed(distance, time)) / pct_max(time)
    end

    def benchmark_vo2_max
      vo2_max(@benchmark.distance, @benchmark.duration)
    end

    private

    # formulae taken from http://www.simpsonassociatesinc.com/

    def pct_max(time)
      0.8+(0.1894393*Math.exp(-0.012778*time))+(0.2989558*Math.exp(-0.1932605*time))
    end

    def vo2(speed)
      -4.60+(0.182258*speed)+(0.000104*speed*speed)
    end

    def speed(distance, time)
      distance * 1000 / time
    end

  end

end

