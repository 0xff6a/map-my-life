class Target < ActiveRecord::Base

  belongs_to :workout

  class << self

    def create_from(params)
      create(params[:target].permit(attributes))
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

end
