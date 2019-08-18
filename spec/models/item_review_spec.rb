require 'rails_helper'

RSpec.describe ItemReview, type: :model do
  describe "商品登録テスト" do
    let!(:user) { create(:user) }
    let!(:item) { create(:item) }
    let!(:item_review) { create(:item_review) }
    context "必要事項がすべて記載されている場合" do
      it "商品レビューが作成されていること" do
        expect(item_review).to be_valid
      end
    end
  end
  describe "バリデーションテスト" do
    context "ユニークかどうか" do
      it { is_expected.to validate_uniqueness_of(:review) }
    end
    context "レビューが空白でないか" do
      it { is_expected.to validate_presence_of(:review) }
    end
    context "文字数が1文字以上かどうか" do
      it { is_expected.to validate_length_of(:review).
        is_at_least(1)
       }
    end
  end
end
