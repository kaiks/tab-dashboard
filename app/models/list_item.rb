# frozen_string_literal: true

class ListItem < ApplicationRecord
  belongs_to :list
  OLD_DAYS = 1
  VERY_OLD_DAYS = 5
  before_save :fix_url
  before_save :set_description_placeholder
  after_create :set_description_as_title
  before_save :set_read_at, if: :read_changed?
  # TODO: validity conditions (e.g. read but no read date)

  protected

  def fix_url
    self.url = "http://#{url}" unless url[%r{\Ahttp://}] || url[%r{\Ahttps://}]
  end

  def set_description_placeholder
    self['description'] ||= self['url']
  end

  def set_description_as_title
    self['description'] = 
      open(self['url'])
        .read
        .scan(%r{<title>(.*?)</title>})
        .flatten
        .first
    save
  rescue StandardError => e
    Rails.logger.debug "Failed getting title for #{id}: #{url}"
    puts "Failed getting title for #{id}: #{url}"
    puts e
  end

  def set_read_at
    self.read_at = read? ? DateTime.now : nil
  end
end
