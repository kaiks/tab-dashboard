class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.text :url
      t.boolean :read
      t.datetime :read_at
      t.boolean :removed

      t.timestamps
    end
  end
end
