require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Ermiyas', photo: 'https://picsum.photos/200/300', bio: 'I am a software engineer',
                        postsCounter: 0)
    @post = Post.create(title: 'This is my first post!!', text: 'I like it!!', author_id: @user.id, commentsCounter: 0,
                        likesCounter: 0)

    get user_posts_path(@user, @post)
  end

  describe 'GET /posts' do
    it 'returns http success' do
      # test for http response status
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'response is rendered with the correct template' do
      # correct response is rendered
      expect(response).to render_template(:index)
    end

    it 'response body includes all posts' do
      # include correct placeholders
      expect(response.body).to include @post.title
    end
  end

  describe 'GET /posts/:id' do
    before(:each) { get user_post_path(@user, @post) }
    it 'returns http success' do
      # test for http response status
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'response is rendered with the correct template' do
      # correct response is rendered
      expect(response).to render_template(:show)
    end

    it 'response body includes all posts' do
      # include correct placeholders
      expect(response.body).to include @post.text
    end
  end
end
