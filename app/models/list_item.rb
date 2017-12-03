class ListItem < ApplicationRecord
  belongs_to :list
  OLD_DAYS = 1
  VERY_OLD_DAYS = 5
  before_save :fix_url
  before_save :set_description_placeholder
  after_create :set_description_as_title
  before_save :set_read_at, if: :read_changed?
  #todo: validity conditions (e.g. read but no read date)

  protected

  def fix_url
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end

  def set_description_placeholder
    self['description'] ||= self['url']
  end


  def set_description_as_title
    begin
      self['description'] = open(self['url']).read.scan(/<title>(.*?)<\/title>/).flatten.first
      save
    rescue Exception => e
      Rails.logger.debug "Failed getting title for #{id}: #{url}"
      puts "Failed getting title for #{id}: #{url}"
      puts e
    end
  end

  def set_read_at
    self.read_at = read? ? DateTime.now : nil
  end

end
