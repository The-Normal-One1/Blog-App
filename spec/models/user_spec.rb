require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'Ermiyas Demsew', postsCounter: 0) }

  let!(:post1) do
    Post.create(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0)
  end
  let!(:post2) do
    Post.create(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0)
  end
  let!(:post3) do
    Post.create(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0)
  end
  let!(:post4) do
    Post.create(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0)
  end

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

  it 'should return the most recent posts' do
    expect(user.recent_posts).to eq([post4, post3, post2])
  end

  it 'update_post_counter_cache' do
    expect(user.postsCounter).to eq(4)
  end
end
