# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KnowledgeRepository, type: :model do
  it { should belong_to :user }

  it 'adds http to url' do
    repository = create(:knowledge_repository, url: "www.example.com")
    expect(repository.url).to eq 'http://www.example.com'
  end
end
