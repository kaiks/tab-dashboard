require 'open-uri'

namespace :link_item do
  desc 'Read titles of link items and set them as description if none present'
  task get_descriptions: :environment do
    ListItem.where(description: nil).each do |li|
      li.send(:set_title)
    end
  end

end
