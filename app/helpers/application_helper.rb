module ApplicationHelper
  def humanize_date(date)
    date.strftime("%d %b, %Y")
  end
end
