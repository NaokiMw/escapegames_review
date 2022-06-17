require 'rails_helper'

RSpec.describe "Tags", type: :request do
  let(:user) { create(:user) }  
  let(:review) { create(:review, user_id: user.id) }
  let(:tag) { create(:tag) }

  before do 
    sign_in user
  end
  it 'タグのindex画面が表示されること' do
    get tags_path
    expect(response).to have_http_status(200)
  end
  it 'タグのindexページの中身が正しく取得されること' do
    get tags_path(id: tag.id, review_id: review.id)
    within(".main") do
      expect(response.main).to include tag.name
    end
  end
end
