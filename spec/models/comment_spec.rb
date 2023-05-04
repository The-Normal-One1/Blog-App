require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.new(name: 'Ermiyas Demsew', postsCounter: 0) }

  subject(:post) do
    Post.new(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0)
  end

  subject(:comment) { Comment.new(author: user, post:, text: 'This is a test for comment model using tdd') }

  before { comment.save }

  it 'should be valid' do
    expect(comment).to be_valid
  end

  it 'should update the comment counter cache' do
    expect(post.commentsCounter).to eq(1)
  end
end
