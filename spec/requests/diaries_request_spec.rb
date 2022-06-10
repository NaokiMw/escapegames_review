require 'rails_helper'

RSpec.describe "Diaries", type: :request do
  let(:user) { create(:user) }
  let(:diary) { create(:diary) }
  let(:diary_params) { attributes_for(:diary) }
  

  describe 'DIARY #create' do
    before do 
      sign_in user
    end

    it '日記の新規登録画面が表示されること' do
      get new_diary_path
      expect(response).to have_http_status(200)
    end
    it '日記のindexページが表示されること' do
      get diaries_path
      expect(response).to have_http_status(200)
    end
    it '日記のindexページの中身が正しく取得されていること' do
      get diaries_path(id: diary.id,user_id: user.id)
      within(".main") do
        expect(response.main).to include diary.title
        expect(response.main).to include diary.user.username
        expect(response.main).to include diary.result
        expect(response.main).to include diary.status
        expect(response.main).to include diary.play_day
        expect(response.main).to include diary.start_time
      end
    end
    it '日記の編集画面が表示されること' do
      get edit_diary_path(id: diary.id,user_id: user.id)
      expect(response).to have_http_status(200)
    end
    it '日記の詳細画面の中身が正しく取得されていること' do
      get diary_path(id: diary.id,user_id: user.id)
      within(".main") do
        expect(response.main).to include diary.title
        expect(response.main).to include diary.user.username
        expect(response.main).to include diary.result
        expect(response.main).to include diary.status
        expect(response.main).to include diary.description
        expect(response.main).to include diary.play_day
        expect(response.main).to include diary.start_time
      end
    end
  end
end

