module ApplicationHelper

  def format_pct(number)
    return 'N/A' unless number.is_a?(Numeric)
    sprintf('%.2f', number) + '%'
  end

  def minutize(number)
    return 'N/A' unless number.is_a?(Numeric)
    sprintf('%.2f', number.divmod(1).map{|n| n < 1 ? n * 0.6 : n}.inject(:+))
  end

end
