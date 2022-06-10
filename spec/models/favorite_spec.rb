require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:user) { create(:user) }
  let!(:review) { create(:review, user_id: user.id) }
  before do
    @favorite = build(:favorite, user_id: user.id, review_id: review.id)
  end
  describe '正常値と異常値の確認' do
    context 'favoriteモデルのバリデーション' do
      it "user_idとreview_idがあれば保存できる" do
        expect(create(:favorite, user_id: user.id, review_id: review.id)).to be_valid
      end

      it "user_idがなければ無効な状態であること" do
        @favorite.user_id = nil
        @favorite.valid?
        expect(@favorite.errors[:user_id]).to include("を入力してください")
      end
      it "review_idがなければ無効な状態であること" do
        @favorite.review_id = nil
        @favorite.valid?
        expect(@favorite.errors[:review_id]).to include("を入力してください")
      end
      it "user_idが同じで,review_idが違う場合でも保存できること" do
        another_review = create(:review, user_id: user.id)
        expect(FactoryBot.create(:favorite, user_id: user.id, review_id: another_review.id)).to be_valid
      end
      it "review_idが同じで,user_idが違う場合でも保存できること" do
        another_user = create(:user, email: "another@gmail.com")
        expect(FactoryBot.create(:favorite, user_id: another_user.id, review_id: review.id)).to be_valid
      end
    end
  end
end
