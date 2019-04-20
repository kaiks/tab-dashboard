# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Dashboard", type: :feature do
  before(:each) do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  scenario 'User sees their own Knowledge Repositories only' do
    create(:knowledge_repository, name: "My repo", user: @user)
    create(:knowledge_repository, name: "Their repo", user: create(:user))

    visit "/"
    expect(page).to have_text "My repo"
    expect(page).not_to have_text "Their repo"
  end
end