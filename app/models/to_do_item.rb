class ToDoItem < ApplicationRecord
  belongs_to :user
  before_save :set_done_at, if: :done_changed?


  protected
  def set_done_at
    self.done_at = done? ? DateTime.now : nil
  end
end
