require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    let!(:user) { create(:user) }
    it "リクエストが成功する" do
      get 'index'
      expect(response.status).to eq 200
    end
  end
end
