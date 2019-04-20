# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:lists) }
  it { should have_many(:to_do_items) }
  it { should have_many(:knowledge_repositories) }
end
