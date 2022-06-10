require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:review) { create(:review) }
  let(:diary) { create(:diary) }

  before do 
    sign_in user
  end

  describe "GET /show" do
    it "マイページが表示されること" do
      get users_show_path(id: user.id)
      expect(response).to have_http_status(200)
    end
  end

end
