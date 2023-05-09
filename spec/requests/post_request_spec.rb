require 'rails_helper'

RSpec.describe "Posts", type: :request do
    describe "GET /posts" do
        it "returns http success" do
        get "/posts"
        #test for http response status
        expect(response).to have_http_status(:success)
        expect(response.status).to eq(200)
        #correct response is rendered
        expect(response).to render_template(:index)
        # include correct placeholders
        expect(response.body).to include("All posts")
        expect(response.body).to include("Hello")
        expect(response.body).to include("This is the second post!!")
        end
    end

    describe "GET /posts/:id" do
        it "returns http success" do
        get "/users/1/posts/1"
        #test for http response status
        expect(response).to have_http_status(:success)
        expect(response.status).to eq(200)
        #correct response is rendered
        expect(response).to render_template(:show)
        # include correct placeholders
        expect(response.body).to include("Hello")
        end
    end
end
