require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
    it 'redirects to login' do 
        get :index
        expect(response).to redirect_to('/login')
    end
end
