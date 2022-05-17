require 'rails_helper'

RSpec.describe Review, type: :model do
  let!(:user) {create(:user)}
  before do
    @review = build(:review, user_id: user.id)
  end

  describe 'バリデーション' do
    it '全ての値が設定されている場合、新規登録されること' do
      expect(@review.valid?).to eq(true)
    end
  end
end
