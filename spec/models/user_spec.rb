require 'rails_helper'

RSpec.describe User, type: :model do
  describe "データ挿入テスト" do
    let!(:shop) { create(:shop) }
    let!(:user) { create(:user, shop_id: shop.id) }
    context "必要事項が全て記入されている場合" do
      it "ユーザー作成がされていること" do
        expect(user).to be_valid
      end
    end
  end
  describe 'varidate動作検証' do
    let!(:shop) { create(:shop) }
    let(:user) { build(:user, shop_id: shop.id) }
    subject { save }
    shared_examples 'saveに失敗する例' do
      it { is_expected.to eq(false) }
    end
    context 'shop_idがないためsaveができない' do
      before do
        user.shop_id = ''
      end
      let(:save) { user.save }
      it_behaves_like 'saveに失敗する例'
    end
    context 'nameがないためsaveができない' do
      before do
        user.name = ''
      end
      let(:save) { user.save }
      it_behaves_like 'saveに失敗する例'
    end
    context 'emailがないためsaveができない' do
      before do
        user.email = ''
      end
      let(:save) { user.save }
      it_behaves_like 'saveに失敗する例'
    end
    context 'passwordがないためsaveができない' do
      before do
        user.password = ''
      end
      let(:save) { user.save }
      it_behaves_like 'saveに失敗する例'
    end
  end
end

