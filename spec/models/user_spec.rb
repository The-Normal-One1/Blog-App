require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'Ermiyas Demsew', postsCounter: 0) }

  before { user.save }

  it 'name should be present' do
    user.name = '     '
    expect(user).to_not be_valid
  end

  it 'postsCounter should be present' do
    user.postsCounter = nil
    expect(user).to_not be_valid
  end

  it 'postsCounter should be greater than or equal to 0' do
    user.postsCounter = -1
    expect(user).to_not be_valid
  end

  it 'postsCounter should be an integer' do
    user.postsCounter = 1.5
    expect(user).to_not be_valid
  end

  it 'should be valid' do
    expect(user).to be_valid
  end
end
