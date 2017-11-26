class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :title,  null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :user_id
      t.integer :position

      t.timestamps
    end

    add_column :list_items, :list_id, :integer
  end
end
