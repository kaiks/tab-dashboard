# frozen_string_literal: true

class KnowledgeRepository < ApplicationRecord
  before_save :fix_url
  belongs_to :user

  protected

  def fix_url
    self.url = "http://#{url}" unless url[%r{\Ahttp://}] || url[%r{\Ahttps://}]
  end
end
