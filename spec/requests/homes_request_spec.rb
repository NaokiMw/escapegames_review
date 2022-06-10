require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /show" do
    it "トップページが表示されること" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
