require 'rails_helper'

RSpec.describe "Signups", type: :request do
  describe "GET /signup" do
    before do
      get signup_url
      expect(response).to render_template(:new)
    end

    it "don't allow signup with invalid email" do
      post "/users", params: {user: {email: 'nitya@#', password: 'V@lidPassw0rd'}}
      expect(response).to render_template(:new)
    end

    it "don't allow signup with invalid password" do
      post "/users", params: {user: {email: 'nitya@gmail.com', password: 'pass'}}
      expect(response).to render_template(:new)
    end

    it 'allow sign up with valid username and password' do
      post "/users", params: {user: {email: 'nitya@gmail.com', password: 'V@lidPassw0rd'}}
      puts response.status
      expect(response).to redirect_to(home_url)
    end
  end
end
