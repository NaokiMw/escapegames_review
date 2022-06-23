require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let(:user) { create(:user) }
  let(:review) { create(:review, user_id: user.id) }
  let(:review_params) { attributes_for(:review) }
  
  describe "GET /index,show,new," do
    before do 
      sign_in user
    end
    it 'レビューの新規登録画面が表示されること' do
      get new_review_path
      expect(response).to have_http_status(200)
    end
    it 'レビューのindex画面が表示されること' do
      get reviews_path
      expect(response).to have_http_status(200)
    end
    it 'レビューのindexページの中身が正しく取得されること' do
      get reviews_path(id: review.id, user_id: user.id)
      within(".main") do
        expect(response.main).to include review.title
        expect(response.main).to include review.user.username
        expect(response.main).to include review.review_1
        expect(response.main).to include review.review_2
        expect(response.main).to include review.review_3
        expect(response.main).to include review.review_4
        expect(response.main).to include review.review_5
        expect(response.main).to include review.play_day
        expect(response.main).to include review.start_time
        expect(response.main).to include review.address
        expect(response.main).to include review.image
      end
    end
  end
end
