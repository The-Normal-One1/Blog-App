require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'returns http success' do
      get '/posts'
      # test for http response status
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'response is rendered with the correct template' do
      get '/posts'
      # correct response is rendered
      expect(response).to render_template(:index)
    end

    it 'response body includes all posts' do
      get '/posts'
      # include correct placeholders
      expect(response.body).to include('All posts')
      expect(response.body).to include('Post about life')
      expect(response.body).to include('Post about industy')
    end
  end

  describe 'GET /posts/:id' do
    it 'returns http success' do
      get '/users/1/posts/443'
      # test for http response status
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      # correct response is rendered
      expect(response).to render_template(:show)
    end

    it 'response is rendered with the correct template' do
      get '/users/1/posts/443'
      # correct response is rendered
      expect(response).to render_template(:show)
    end

    it 'response body includes all posts' do
      get '/users/1/posts/443'
      # include correct placeholders
      expect(response.body).to include('I like it!!')
    end
  end
end
