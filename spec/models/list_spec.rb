# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  it { should belong_to :user }
  it { should have_many :list_items }

  
end
