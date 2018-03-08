class CreateKnowledgeRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :knowledge_repositories do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
