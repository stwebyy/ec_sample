require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品登録テスト" do
    let!(:item) { create(:item) }
    context "必要事項がすべて記載されている場合" do
      it "商品が作成されていること" do
        expect(item).to be_valid
      end
    end
  end
  
end
