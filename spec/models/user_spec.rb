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

    it 'should save successfully' do
      user = User.new(email: 'xyz1@xyz.com', password: 'heyypassword').save
      expect(user).to eq(true)
    end
  end
end
