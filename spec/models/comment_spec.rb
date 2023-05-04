require 'rails_helper'

RSpec.describe Comment, type: :model do

    subject(:user) { User.new(name: 'Ermiyas Demsew', postsCounter: 0) }

    subject(:post) { Post.new(author: user, title: 'This is a test for post model using tdd', commentsCounter: 0, likesCounter: 0) }

    subject(:comment) { Comment.new(author: user, post: post, text: 'This is a test for comment model using tdd') }

    before { comment.save }
    
        it 'should be valid' do
             expect(comment).to be_valid
        end
end
