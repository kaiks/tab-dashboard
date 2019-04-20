module KnowledgeRepositories
  extend ActiveSupport::Concern

  included do
    before_action :load_knowledge_repositories
  end

  def load_knowledge_repositories
    @knowledge_repositories = if current_user
                                KnowledgeRepository.where(user: current_user).all
                              else
                                KnowledgeRepository.none
                              end
  end
end