class KnowledgeRepository < ApplicationRecord
  before_save :fix_url

  protected
  def fix_url
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "http://#{self.url}"
    end
  end
end