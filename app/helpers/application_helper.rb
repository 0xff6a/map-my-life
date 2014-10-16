module ApplicationHelper

  def format_pct(number)
    return 'N/A' unless number
    sprintf('%.2f', number) + '%'
  end

end
