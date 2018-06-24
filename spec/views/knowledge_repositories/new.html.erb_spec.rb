require 'rails_helper'

RSpec.describe "knowledge_repositories/new", skip: 'not implemented', type: :view do
  before(:each) do
    assign(:knowledge_repository, KnowledgeRepository.new())
  end

  it "renders new knowledge_repository form" do
    render

    assert_select "form[action=?][method=?]", knowledge_repositories_path, "post" do
    end
  end
end
