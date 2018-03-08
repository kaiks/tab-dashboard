require 'rails_helper'

RSpec.describe "knowledge_repositories/edit", type: :view do
  before(:each) do
    @knowledge_repository = assign(:knowledge_repository, KnowledgeRepository.create!())
  end

  it "renders the edit knowledge_repository form" do
    render

    assert_select "form[action=?][method=?]", knowledge_repository_path(@knowledge_repository), "post" do
    end
  end
end
