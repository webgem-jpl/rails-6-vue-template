require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:valid_session) { {} }

  describe 'GET #index' do
    context 'user is logged in' do
      login_user

      it 'returns a success response - when sign in' do
        create(:project)
        get :index, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'GET #index' do
    context 'user is logged out' do
      logout_user

      it 'redirect to sign in page' do
        get :index, params: {}
        expect(response).to have_http_status(302)
      end
    end
  end
end
