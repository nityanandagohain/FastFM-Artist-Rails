require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do 
    it 'ensures the email presence' do 
      user = User.new(password: 'xyzabcd').save
      expect(user).to eq(false)
    end

    it 'ensures the password presence' do 
      user = User.new(email: 'xyz@gmail.com').save
      expect(user).to eq(false)
    end

    it 'ensures the vaild email' do 
      user = User.new(email: '12xyz1@', password: 'heyypassword').save
      expect(user).to eq(false)
      user = User.new(email: 'xyz1@##', password: 'heyypassword').save
      expect(user).to eq(false)
      user = User.new(email: 'xyz1@xyz', password: 'heyypassword').save
      expect(user).to eq(true)
    end

    it 'ensures the password length is greater than five' do 
      user = User.new(email: 'xyz1@xyz.com', password: 'pass').save
      expect(user).to eq(false)
    end

    it 'ensures the users are not created with same email' do 
      user1 = User.new(email: 'xyz1@xyz.com', password: 'heyypassword1').save
      user2 = User.new(email: 'xyz1@xyz.com', password: 'heyypassword2').save
      expect(user1).to eq(true)
      expect(user2).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(email: 'xyz1@xyz.com', password: 'heyypassword').save
      expect(user).to eq(true)
    end
  end
end
