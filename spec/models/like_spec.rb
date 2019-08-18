require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "いいね機能テスト" do
    let!(:user) { create(:user) }
    let!(:item) { create(:item) }
    let!(:like) { create(:like) }
    context "いいね登録" do
      it "いいねが正しく登録されていること" do
        expect(like).to be_valid
      end
    end
  end
  describe "バリデーションテスト" do
    let!(:like_two) { build(:like) }
    before do
      like_two.user_id = 1
      like_two.item_id = 1
    end
    let(:save) { like_two.save }
    context "同じアイテムにユーザーがいいねできる数が一つだけ" do
      it { expect(save).to eq(false) }
    end
  end
end
