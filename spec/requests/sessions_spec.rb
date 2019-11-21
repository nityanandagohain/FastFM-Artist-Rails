require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    before do
      get login_url
      expect(response).to render_template(:new)
    end

    let(:user) { FactoryBot.create(:user) }

    it "don't allow login with invalid email" do
      post "/sessions", params: {user: {email: 'another@email.com', password: user.email}}
      expect(response).to render_template(:new)
    end

    it "don't allow login with invalid password" do
      post "/sessions", params: {user: {email: user.email, password: 'anotherpass'}}
      expect(response).to render_template(:new)
    end

    it 'allow sign up with valid username and password' do
      post "/sessions", params: {email: user.email, password: user.password}
      expect(response).to redirect_to(home_url)
    end

    it 'allow users to log out' do
      get '/logout'
      expect(response).to have_http_status(:redirect)
    end
  end
end
