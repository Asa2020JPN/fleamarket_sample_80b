# bundle exec rspec spec/controllers/registrations_controller_spec.rb

require 'rails_helper'

RSpec.describe  Users::RegistrationsController, type: :controller do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end
