require 'rails_helper'

describe UsersController do
  let(:user) { User.create!(email: "lildoor@me.com", password: "password") }
  let(:user2) { User.create!(email: "jason.laporte@me.com", password: "password") }

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end

      it 'does not allow user to see other users' do

      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
