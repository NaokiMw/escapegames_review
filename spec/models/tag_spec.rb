require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = build(:tag)
  end

  describe 'バリデーション' do
    it '全ての値が設定されている場合、タグが作成されること' do
      expect(@tag.valid?).to eq(true)
    end
  end
end
