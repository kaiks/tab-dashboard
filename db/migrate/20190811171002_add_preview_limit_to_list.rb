class AddPreviewLimitToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :preview_limit, :integer, default: 5
    List.update_all(preview_limit: 5)
  end
end
