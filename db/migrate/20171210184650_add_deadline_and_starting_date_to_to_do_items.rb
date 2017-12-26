class AddDeadlineAndStartingDateToToDoItems < ActiveRecord::Migration[5.1]
  def change
    add_column :to_do_items, :valid_from, :datetime
    add_column :to_do_items, :deadline, :datetime
    ToDoItem.update_all('valid_from = created_at')
  end
end
