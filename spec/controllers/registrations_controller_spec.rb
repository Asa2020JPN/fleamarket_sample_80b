# bundle exec rspec spec/controllers/registrations_controller_spec.rb

require 'rails_helper'

RSpec.describe  Users::RegistrationsController, type: :controller do

  let(:user) { create(:user) }

  before do
    login user
  end

  describe 'GET #new' do

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end

  end


  describe 'POST #create_identification' do
    context '有効なパラメータの場合' do
      before do
        @identification = attributes_for(:identification)
        session["devise.regist_data"] = FactoryBot.attributes_for(:user)
      end

      it "レスポンスが成功すること" do
        get :create_identification
        expect(response).to be_successful
      end

      it 'まだ保存はされていない' do
        expect{
          post :create_identification, params: @identification
        }.not_to change(Identification, :count)
      end

      it '200 ok' do
        post :create_identification, params: @identification
        expect(response.status).to eq 200
      end

      it 'renders the :new_address template' do
        post :create_identification, params: @identification
        expect(response).to render_template :new_address
      end
    end

    context '無効なパラメータの場合' do
      before do
        @invalid_identification = FactoryBot.attributes_for(:identification, last_name: nil)
        session["devise.regist_data"] = FactoryBot.attributes_for(:user)
      end

      it 'miss 200 ok' do
        post :create_identification, params: @invalid_identification
        expect(response.status).to eq 200
      end

      it "renders the :new_identification template" do
        post :create_identification, params: @invalid_identification
        expect(response).to render_template :new_identification
      end
    end
  end
end
