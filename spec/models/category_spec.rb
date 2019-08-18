require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "カテゴリ登録テスト" do
    let!(:user) { create(:user) }
    let!(:item) { create(:item) }
    let!(:category) { create(:category) }
    context "カテゴリ作成" do
      it "カテゴリ名が正しく入力されていること" do
        expect(category).to be_valid
      end
    end
  end
  describe "バリデーションテスト" do
    context "レビューが空白でないか" do
      it { is_expected.to validate_presence_of(:name) }
    end
    context "文字数が1文字以上かどうか" do
      it { is_expected.to validate_length_of(:name).
        is_at_least(1)
       }
    end
  end
end
