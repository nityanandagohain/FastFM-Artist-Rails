require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    it "load login page" do
        get :new
        expect(response).to render_template(:new)
        expect(response.status).to eq(200)
    end
end
