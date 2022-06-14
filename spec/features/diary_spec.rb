require 'rails_helper'

RSpec.feature "Diaries", type: :feature do
  include Devise::Test::IntegrationHelpers
  describe "#日記機能のテスト" do
    given(:user) { create(:user) }
    given(:diary) { create(:diary, user_id: user.id) }
    before do
      sign_in user
      visit diaries_path(id: diary.id, user_id: user.id)
    end
    scenario '日記の新規作成画面に移動すること' do
      click_link '新しい日記作成'
      expect(page).to have_content '日記新規作成'
    end
    scenario '作成された日記一覧の情報を取得できていること' do
      within '.main' do
        expect(page).to have_content diary.title
        expect(page).to have_content diary.user.username
      end
    end
    scenario '日記一覧にある日記をクリックすると、日記の詳細画面に移動すること' do
      click_link diary.title
      expect(page).to have_content diary.description
    end
    scenario '作成したユーザーの日記の詳細画面には編集と削除のリンクが表示されていること' do
      click_link diary.title
      expect(page).to have_content '編集'
      expect(page).to have_content '削除'
    end
  end
  describe "#別のユーザーの場合の日記機能のテスト" do
    given(:user) { create(:user) }
    given(:another_user) { create(:user, email: "another@gmail.com") }
    given(:diary) { create(:diary, user_id: user.id) }
    before do
      sign_in another_user
      visit diaries_path(id: diary.id, user_id: another_user.id)
    end
    scenario '別のユーザーの日記の詳細画面には編集と削除のリンクが表示されていないこと' do
      click_link diary.title
      expect(page).not_to have_content '編集'
      expect(page).not_to have_content '削除'
    end
  end
end
