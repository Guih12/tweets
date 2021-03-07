require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should fail if name is empty' do
    user = User.new(name: nil)
    expect(user).to_not be_valid 
  end

  it 'Should fail if lastname is empty'do
    user = User.new(name:'George', lastname: nil)
    expect(user).to_not be_valid 
  end

  it 'Should fail if email is empty' do
    user = User.new(name: 'George', lastname: 'Borsato', email: nil)
    expect(user).to_not be_valid 
  end
  
  it 'Should fails if password is empty' do
    user = User.new(name: 'George', lastname: 'borsato', email:'georginhoborsato@gmail.com', password_digest: nil)
    expect(user).to_not be_valid 
  end

  it 'Should valid user'do
    user = User.new(name: 'George', lastname: 'Borsato', email: 'georginhoborsato@gmail.com', password_digest: '123456')
    expect(user).to be_valid
  end

end
