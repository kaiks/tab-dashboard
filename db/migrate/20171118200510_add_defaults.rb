class AddDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_default :list_items, :read, :false
    change_column_default :list_items, :removed, :false
  end
end
