class FixBrokenSqliteDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_default :to_do_items, :done, 'f'
    change_column_default :to_do_items, :removed, 'f'
    change_column_default :list_items, :read, 'f'
    change_column_default :list_items, :removed, 'f'
    ToDoItem.where("done = 'false'").update_all("done = 'f'")
    ToDoItem.where("removed = 'false'").update_all("removed = 'f'")
    ListItem.where("read = 'false'").update_all("read = 'f'")
    ListItem.where("removed= 'false'").update_all("removed = 'f'")
  end
end
