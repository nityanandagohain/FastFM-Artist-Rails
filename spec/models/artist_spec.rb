require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'validation test' do
    before do
      @user1 = User.new(email: 'xyz4@xyz.com', password: 'heyypassword')
      @user1.artists << Artist.new(name: "David")
      @user2 = User.new(email: 'xyz5@xyz.com', password: 'heyypassword1')
      @user2.artists << Artist.new(name: "Hanna")
    end
    
    it 'ensures that aritist is present' do
      expect(@user1.artists.first.name).to eq("David")
    end

    it 'ensures that artist is inserted to user' do
      expect(@user1.artists.size).to eq(1)
    end
  end
end
