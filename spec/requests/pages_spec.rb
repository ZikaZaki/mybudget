require 'rails_helper'
RSpec.describe 'Pages', type: :request do
  describe 'GET /pages/home' do
    context 'when signed in' do
      let(:user) { users(:test) }

      before { sign_in(user) }

      it 'returns http success' do
        get '/pages/home'
        expect(response).to have_http_status(:success)
      end

      it 'renders the user name' do
        get '/pages/home'
        expect(response.body).to include('Test')
      end
    end

    context 'when signed out' do
      it 'redirects to sign in' do
        get '/pages/home'
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
