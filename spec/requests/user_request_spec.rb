require 'rails_helper'

RSpec.describe 'Users', type: :request do

  before(:each) do
    @user = User.create(name: 'Ermiyas', photo: 'https://picsum.photos/200/300', bio: 'I am a software engineer', postsCounter: 0)

    get users_path
  end
  describe 'GET /users' do
    it 'returns http success' do
      # test for http response status
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
      expect(response.status).to eq(200)
    end

    it 'response is rendered with the correct template' do
      # correct response is rendered
      expect(response).to render_template(:index)
    end

    it 'response body includes all users' do
      # include correct placeholders
      expect(response.body).to include('Ermiyas')
    end
  end

  describe 'GET /users/:id' do

    before(:each) { get user_path(@user) }

    it 'returns http success' do
      # test for http response status
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
      expect(response.status).to eq(200)
    end

    it 'response is rendered with the correct template' do
      # correct response is rendered
      expect(response).to render_template(:show)
    end

    it 'response body includes all users' do
      # include correct placeholders
      expect(response.body).to include('I am a software engineer')
    end
  end
end
