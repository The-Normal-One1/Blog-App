require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:user) { User.new(name: 'Ermiyas Demsew', postsCounter: 0) }

  let!(:post) do
    Post.create(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0)
  end
  let!(:comment1) do
    Comment.create(author: user, post:, text: 'This is a test for comment model using tdd')
  end
  let!(:comment2) do
    Comment.create(author: user, post:, text: 'This is a test for comment model using tdd')
  end
  let!(:comment3) do
    Comment.create(author: user, post:, text: 'This is a test for comment model using tdd')
  end
  let!(:comment4) do
    Comment.create(author: user, post:, text: 'This is a test for comment model using tdd')
  end
  let!(:comment5) do
    Comment.create(author: user, post:, text: 'This is a test for comment model using tdd')
  end
  let!(:comment6) do
    Comment.create(author: user, post:, text: 'This is a test for comment model using tdd')
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

  it 'should return the most recent comments' do
    expect(post.recent_comments).to eq([comment6, comment5, comment4, comment3, comment2])
  end

  it 'should increment commentsCounter by 6' do
    expect(post.commentsCounter).to eq(6)
  end
end
