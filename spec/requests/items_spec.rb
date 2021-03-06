require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /items" do
    let!(:user) { create(:user) }
    let!(:item) { create(:item) }
    let!(:category) { create(:category) }
    subject { response.body }
    describe "ログイン状態は関係無し" do
      it "render index" do
        get items_path
        expect(response).to have_http_status(200)
      end
      it '商品名が表示されていること' do
        get items_path
        is_expected.to include "TEST_ITEM_NAME"
      end
      it 'カテゴリが表示されていること' do
        get items_path
        is_expected.to include "TEST_CATEGORY_NAME"
      end
      it '商品登録へのリンクが表示されないこと' do
        get items_path
        is_expected.not_to include "商品登録"
      end
      it 'カテゴリ登録へのリンクが表示されないこと' do
        get items_path
        is_expected.not_to include "カテゴリ登録"
      end
    end
    describe "ログインしていない場合" do
      it 'ログイン中が表示されないこと' do
        get items_path
        is_expected.not_to include "ログイン中"
      end
      it 'ログアウトが表示されないこと' do
        get items_path
        is_expected.not_to include "ログイン中"
      end
    end
    describe "管理者がログインしている場合" do
      before do
        sign_in user
      end
      it 'ログイン中が表示されること' do
        get items_path
        is_expected.to include "ログイン中"
      end
      it '情報変更リンクが表示されること' do
        get items_path
        is_expected.to include "情報変更"
      end
      it '削除リンクが表示されること' do
        get items_path
        is_expected.to include "削除"
      end
      it '商品登録リンクが表示されること' do
        get items_path
        is_expected.to include "商品登録"
      end
      it 'カテゴリ登録リンクが表示されること' do
        get items_path
        is_expected.to include "カテゴリ登録"
      end
    end
  end
  describe "GET /items/show" do
    let!(:user) { create(:user) }
    let!(:item) { create(:item, stocks: 10, price: 1000) }
    let!(:category) { create(:category) }
    subject { response.body }
    describe "ログイン状態は関係無し" do
      it "render show" do
        get item_path(id: item)
        expect(response).to have_http_status(200)
      end
      it '商品名が表示されていること' do
        get item_path(id: item.id)
        is_expected.to include "TEST_ITEM_NAME"
      end
      it 'カテゴリが表示されていること' do
        get item_path(id: item.id)
        is_expected.to include "TEST_CATEGORY_NAME"
      end
      it '在庫数が表示されていること' do
        get item_path(id: item.id)
        is_expected.to include "在庫数：10"
      end
      it '価格が表示されていること' do
        get item_path(id: item.id)
        is_expected.to include "価格：1000"
      end
      it '商品説明が表示されていること' do
        get item_path(id: item.id)
        is_expected.to include "商品説明：TEST_DESCRIPTON"
      end
      it 'カードで支払うボタンが表示される' do
        get item_path(id: item.id)
        is_expected.to include '<form action="/items/1/pay?method=post" accept-charset="UTF-8" method="post">'
      end
      it 'カートボタンが表示される' do
        get item_path(id: item.id)
        is_expected.to include '<input type="submit" name="commit" value="カートに入れる" data-disable-with="カートに入れる" />'
      end
    end
    describe "ログインしている場合" do
      before do
        sign_in user
      end
      it '口コミを書くボタンが表示されていること' do
        get item_path(id: item.id)
        is_expected.to include "口コミを書く"
      end
      it 'いいねボタンが表示される' do
        get item_path(id: item.id)
        is_expected.to include 'form class="button_to" method="post" action="/items/1/likes">'
      end
    end
    describe "ログインしていない場合" do
      it '口コミが表示されていないこと' do
        get item_path(id: item.id)
        is_expected.not_to include "口コミを書く"
      end
      it 'いいねボタンが表示されない' do
        get item_path(id: item.id)
        is_expected.not_to include 'form class="button_to" method="post" action="/items/1/likes">'
      end
    end
  end
  describe "GET /items/new" do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user, admin: false) }
    let!(:category) { create(:category) }
    describe "ログインしていない場合" do
      it 'リダイレクトされること' do
        get new_item_path
        expect(response).to have_http_status(302)
      end
      it '商品が登録されないこと' do
        expect do
          post items_path, params: { item: FactoryBot.attributes_for(:item) }
        end.to change(Item, :count).by(0)
      end
    end
    describe "ログインしているが管理者権限がない場合" do
      before do
        sign_in user2
      end
      it 'ログイン中が表示されること' do
        get items_path
        expect(response.body).to include "ログイン中"
      end
      it '302が返ってくること' do
        get new_item_path
        expect(response).to have_http_status(302)
      end
      it '商品が登録されないこと' do
        expect do
          post items_path, params: { item: FactoryBot.attributes_for(:item) }
        end.to change(Item, :count).by(0)
      end
    end
    describe "管理者権限があるユーザーがログインしている場合" do
      before do
        sign_in user
      end
      it '200が返ってくること' do
        get new_item_path
        expect(response).to have_http_status(200)
      end
      it '商品が登録されること' do
        expect do
          post items_path, params: { item: FactoryBot.attributes_for(:item) }
        end.to change(Item, :count).by(1)
      end
      # TODO
      # it '商品カテゴリが登録されること' do
      #   expect do
      #     post items_path, params: { item: FactoryBot.attributes_for(:item) }
      #   end.to change(ItemCategory, :count).by(1)
      # end
    end
  end
end
