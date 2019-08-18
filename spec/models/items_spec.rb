require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品登録テスト" do
    let!(:user) { create(:user) }
    let!(:item) { create(:item) }
    context "必要事項がすべて記載されている場合" do
      it "商品が作成されていること" do
        expect(item).to be_valid
      end
    end
  end
  describe "varidate動作検証" do
    let!(:user) { build(:user) }
    let!(:item) { build(:item) }
    let!(:item_equal) { build(:item) }
    subject { save }
    shared_examples 'saveに失敗' do
      it { is_expected.to eq(false) }
    end
    context "商品名がない場合" do
      before do
        item.name = ''
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "商品名が同一の場合" do
      before do
        user.save
        item.name = 'equal'
        item.save
        item_equal.name = 'equal'
      end
      let(:save) { item_equal.save }
      it_behaves_like 'saveに失敗'
    end
    context "商品名が50文字以上の場合" do
      before do
        item.name = 'テスト５０文字以上になるようにテストテスト５０文字以上になるようにテストテスト５０文字以上になるようにテスト'
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "在庫が空白の場合" do
      before do
        item.stocks = ''
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "在庫が数字以外の場合" do
      before do
        item.stocks = 'あ'
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "在庫がマイナスの場合" do
      before do
        item.stocks = -1
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "商品説明が空白の場合" do
      before do
        item.description = ''
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "商品説明が3文字未満の場合" do
      before do
        item.stocks = 'aa'
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "表示・非表示が空白の場合" do
      before do
        item.hide = ''
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "価格が空白の場合" do
      before do
        item.price = ''
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "価格が数字以外の場合" do
      before do
        item.price = 'aa'
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "価格が0円以下の場合" do
      before do
        item.price = 0
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
    context "登録するユーザーがadmin権限を持っていない場合" do
      before do
        user.admin = false
        user.save
      end
      let(:save) { item.save }
      it_behaves_like 'saveに失敗'
    end
  end
end
