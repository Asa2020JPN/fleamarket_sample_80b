require 'rails_helper'

# bundle exec rspec spec/controllers/registrations_controller_spec.rb

RSpec.describe  Users::RegistrationsController, type: :controller do

  let(:user) { create(:user) }

  before do
    login user
  end

  describe 'GET #new' do
    it "get newアクションでnewに遷移" do
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

      it "レスポンスが成功する" do
        get :create_identification
        expect(response).to be_successful
      end

      it '保存はされていない' do
        expect{
          post :create_identification, params: @identification
        }.not_to change(Identification, :count)
      end

      it 'リクエストは200 okとなる' do
        post :create_identification, params: @identification
        expect(response.status).to eq 200
      end

      it 'post create_identiifcationアクションでnew_addressに遷移する' do
        post :create_identification, params: @identification
        expect(response).to render_template :new_address
      end
    end

    context '無効なパラメータの場合' do
      before do
        @invalid_identification = FactoryBot.attributes_for(:identification, last_name: nil)
        session["devise.regist_data"] = FactoryBot.attributes_for(:user)
      end

      it 'リクエストは200 okとなる' do
        post :create_identification, params: @invalid_identification
        expect(response.status).to eq 200
      end

      it "post create_identiifcationアクションでnew_identificationに遷移する" do
        post :create_identification, params: @invalid_identification
        expect(response).to render_template :new_identification
      end
    end
  end
end
