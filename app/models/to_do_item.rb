class ToDoItem < ApplicationRecord
  belongs_to :user
  before_save :set_done_at, if: :done_changed?
  before_validation :set_valid_from
  before_validation :autolink
  validate :dates_validator

  #RED = RGB::Color.from_rgb(255, 0, 0)
  #YELLOW = RGB::Color.from_rgb(255, 255, 0)

  protected
  def autolink
    self.content = Rinku.auto_link(content)
  end

  def set_done_at
    self.done_at = done? ? DateTime.now : nil
  end

  def set_valid_from
    persisted? || self.valid_from.present? || self.valid_from = Date.today
  end

  def dates_validator
    if self.deadline.present? && (self.valid_from > self.deadline || self.deadline < Date.today)
      errors.add(:deadline, 'Deadline should be before valid_from and after now')
    end
  end
end
