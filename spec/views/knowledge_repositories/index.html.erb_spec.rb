require 'rails_helper'

RSpec.describe "knowledge_repositories/index", type: :view do
  before(:each) do
    assign(:knowledge_repositories, [
      KnowledgeRepository.create!(),
      KnowledgeRepository.create!()
    ])
  end

  it "renders a list of knowledge_repositories" do
    render
  end
end
