# frozen_string_literal: true

module ApplicationHelper
  def humanize_date(date)
    date.strftime('%d %b, %Y')
  end
end
