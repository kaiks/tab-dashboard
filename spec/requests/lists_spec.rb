require 'rails_helper'

RSpec.describe "Lists", type: :request do
  before(:each) do
    user = create(:user)
    sign_in user
  end

  describe "GET /lists" do
    it "works! (now write some real specs)" do
      get lists_path
      expect(response).to have_http_status(200)
    end
  end
end
