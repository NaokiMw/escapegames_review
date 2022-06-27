require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user, email: 'another@gmail.com') }
  let(:relationship) { user.active_relationships.build(follower_id: another_user.id) }

  describe '#create' do
    context 'succesfully' do
      it 'is valid with test data' do
        expect(relationship).to be_valid
      end
    end

    context 'unsuccesfully' do
      it 'is invalid without follower_id' do
        relationship.follower_id = nil
        expect(relationship).to be_invalid
      end
      it 'is invalid without following_id' do
        relationship.following_id = nil
        expect(relationship).to be_invalid
      end
    end
  end
end
