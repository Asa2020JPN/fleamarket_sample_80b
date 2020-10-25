# bundle exec rspec spec/controllers/registrations_controller_spec.rb

require 'rails_helper'

RSpec.describe  Users::RegistrationsController, type: :controller do

  let(:group) { create(:group) }
  let(:user) { create(:user) }

  # before do
  # request.env["devise.mapping"] = Devise.mappings[:user]
  # end

  describe 'GET #new' do
    before do
      login user
      #get :index
    end

    #it "renders the :new template" do
    #  get :new
    #  expect(response).to render_template :new
    #end

    it "renders the :new_identification template" do
      get :new_identification
      expect(response).to render_template :new_identification
    end

    it "renders the :new_address template" do
      get :new_address
      expect(response).to render_template :new_address
    end

  end
end
