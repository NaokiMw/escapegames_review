require 'rails_helper'

RSpec.describe Diary, type: :model do
  let!(:user) { create(:user) }

  before do
    @diary = build(:diary, user_id: user.id)
  end

  describe 'バリデーション' do
    it '全ての値が設定されている場合、新規登録されること' do
      expect(@diary.valid?).to eq(true)
    end
  end
end
