require 'rails_helper'

RSpec.describe "knowledge_repositories/show", skip: 'not implemented', type: :view do
  before(:each) do
    @knowledge_repository = assign(:knowledge_repository, KnowledgeRepository.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
