require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'GET /comments' do
    it 'returns http success' do
      get '/users/1/posts/443/comments'
      # test for http response status
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
      expect(response.status).to eq(200)
    end

    it 'response is rendered with the correct template' do
      get '/users/1/posts/443/comments'
      # correct response is rendered
      expect(response).to render_template(:index)
    end

    it 'response body includes all comments' do
      get '/users/1/posts/443/comments'
      # include correct placeholders
      expect(response.body).to include('All Comments')
      expect(response.body).to include('I enjoyed watching football games!!')
      expect(response.body).to include('I like front end!!')
    end
  end
end
