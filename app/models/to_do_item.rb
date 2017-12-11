class ToDoItem < ApplicationRecord
  belongs_to :user
  before_save :set_done_at, if: :done_changed?
  before_create :set_valid_from
  validate :dates_valid?

  #RED = RGB::Color.from_rgb(255, 0, 0)
  #YELLOW = RGB::Color.from_rgb(255, 255, 0)

  protected
  def set_done_at
    self.done_at = done? ? DateTime.now : nil
  end

  def set_valid_from
    self.valid_from ||= DateTime.now
  end

  def dates_valid?
    (self.deadline.nil? || self.valid_from < self.deadline) && self.deadline > DateTime.now
  end
end
