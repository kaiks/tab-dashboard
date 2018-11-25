require 'rails_helper'

RSpec.describe "Dashboard", type: :request do
  before(:each) do
    user = create(:user)
    sign_in user
  end

  describe "GET /" do
    it "works!" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
