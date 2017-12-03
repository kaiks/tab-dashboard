class CreateToDoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :to_do_items do |t|
      t.integer :user_id, null: false
      t.string :content,  null: false
      t.boolean :done,  null: false, default: false
      t.boolean :removed,  null: false, default: false
      t.datetime :done_at
      t.text :description

      t.timestamps
    end
  end
end
