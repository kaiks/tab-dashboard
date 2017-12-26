module ToDoItemsHelper
  def urgency_color(to_do_item)
    if to_do_item.deadline.present? && to_do_item.valid_from.present?
      deadline = (DateTime.parse(to_do_item.deadline.to_s) + 1.day - 1.second).to_i
      valid_from = DateTime.parse(to_do_item.valid_from.to_s).to_i
      time_total = deadline - valid_from
      time_remaining = deadline - DateTime.now.to_i
      passed_share = 1.0 - time_remaining.to_f/time_total.to_f
      if passed_share > 0.5
        puts passed_share
        # average of red and yellow
        red = 255
        green = 255-(passed_share-0.5)*2*255
        blue = 125-(passed_share)*125
      else
        green = red = 255
        blue = 255 - passed_share*255
        puts blue
        puts passed_share
      end
      colors = [red, green, blue].map {|c| c.to_i.to_s(16).rjust(2, '0') }
      return '#' + colors.join
    else
      return 'none'
    end
  end
end
