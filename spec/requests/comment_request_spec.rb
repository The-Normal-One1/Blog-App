require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  before(:each) do
    @user = User.create(name: 'Ermiyas', photo: 'https://picsum.photos/200/300', bio: 'I am a software engineer',
                        postsCounter: 0)
    @post = Post.create(title: 'This is my first post!!', text: 'I like it!!', author_id: @user.id, commentsCounter: 0,
                        likesCounter: 0)
    @comment = Comment.create(text: 'I enjoyed watching football games!!', author_id: @user.id, post_id: @post.id)

    get user_post_comments_path(@user, @post, @comment)
  end

  describe 'GET /comments' do
    it 'returns http success' do
      # test for http response status
      expect(response).to have_http_status(200)
    end

    it 'response is rendered with the correct template' do
      # correct response is rendered
      expect(response).to render_template(:index)
    end

    it 'response body includes all comments' do
      # include correct placeholders
      expect(response.body).to include @comment.text
    end
  end
end
