class ChangeTodoTimestampsToDates < ActiveRecord::Migration[5.1]
  def change
    change_column :to_do_items, :valid_from, :date
    change_column :to_do_items, :deadline, :date
  end
end
