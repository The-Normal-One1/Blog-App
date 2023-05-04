require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:user) { User.new(name: 'Ermiyas Demsew', postsCounter: 0) }

  subject(:post) do
    Post.new(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0)
  end

  before { post.save }

  it 'title should be present' do
    post.title = '     '
    expect(post).to_not be_valid
  end

  it 'title should be less than or equal to 250 characters' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'commentsCounter should be present' do
    post.commentsCounter = nil
    expect(post).to_not be_valid
  end

  it 'commentsCounter should be greater than or equal to 0' do
    post.commentsCounter = -1
    expect(post).to_not be_valid
  end

  it 'commentsCounter should be an integer' do
    post.commentsCounter = 1.5
    expect(post).to_not be_valid
  end

  it 'likesCounter should be present' do
    post.likesCounter = nil
    expect(post).to_not be_valid
  end

  it 'likesCounter should be greater than or equal to 0' do
    post.likesCounter = -1
    expect(post).to_not be_valid
  end

  it 'likesCounter should be an integer' do
    post.likesCounter = 1.5
    expect(post).to_not be_valid
  end

  it 'should be valid' do
    expect(post).to be_valid
  end
end
