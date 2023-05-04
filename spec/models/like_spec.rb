require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) { User.new(name: 'Ermiyas Demsew', postsCounter: 0) }

  subject(:post) do
    Post.new(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0)
  end

  subject(:like) { Like.new(author: user, post:) }

  before { like.save }

  it 'should be valid' do
    expect(like).to be_valid
  end

    it 'should update the like counter cache' do
        expect(post.likesCounter).to eq(1)
        end
end
