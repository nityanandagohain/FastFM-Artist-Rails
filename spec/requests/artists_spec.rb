require 'rails_helper'

RSpec.describe "Artists", type: :request do
  describe "GET /" do
    before do
      get '/'
      expect(response).to redirect_to('/login')
    end

    let(:user) { FactoryBot.create(:user) }

    it "search an artist" do
      post sessions_path, params: {email: user.email, password: user.password}
      expect(response).to redirect_to(home_url)
      post "/", params: {artist: {name: 'Dire Straits'}}
      expect(response).to render_template(:result)
    end
  end
end
