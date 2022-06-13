require 'rails_helper'

RSpec.feature "Reviews", type: :feature do
  include Devise::Test::IntegrationHelpers
  describe "#レビュー機能のテスト" do
    given(:user) { create(:user) }
    given(:review) { create(:review, user_id: user.id) }
    before do
      sign_in user
      visit reviews_path(user_id: user.id, review_id: review.id)
    end
    scenario 'レビューの新規作成画面に移動すること' do
      click_link 'レビューの新規登録'
      expect(page).to have_content 'レビュー新規作成'
    end
    scenario '作成されたレビューの情報を取得できていること' do
      within '.main' do
        expect(page).to have_content review.title
        expect(page).to have_content review.user.username
      end
    end
    scenario '作成したユーザーのレビューには削除のリンクが表示されていること' do
      expect(page).to have_content 'レビューの削除'
    end
  end
  describe "#別のユーザーの場合のレビュー機能のテスト" do
    given(:user) { create(:user) }
    given(:another_user) { create(:user, email: "another@gmail.com") }
    given(:review) { create(:review, user_id: user.id) }
    before do
      sign_in another_user
      visit reviews_path(user_id: another_user.id, review_id: review.id)
    end
    scenario '作成していないユーザーのレビューには削除のリンクが表示されていないこと' do
      expect(page).not_to have_content 'レビューの削除'
    end
  end
end
