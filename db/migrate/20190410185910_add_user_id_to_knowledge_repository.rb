class AddUserIdToKnowledgeRepository < ActiveRecord::Migration[5.2]
  def change
    add_reference :knowledge_repositories, :user, foreign_key: true
  end
end
