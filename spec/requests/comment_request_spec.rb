require 'rails_helper'

RSpec.describe "Comments", type: :request do
    describe "GET /comments" do
        it "returns http success" do
        get "/users/1/posts/1/comments"
        #test for http response status
        expect(response).to have_http_status(:success)
        expect(response).to have_http_status(200)
        expect(response.status).to eq(200)
        #correct response is rendered
        expect(response).to render_template(:index)
        # include correct placeholders
        expect(response.body).to include("All Comments")
        expect(response.body).to include("How are you doing my friend!")
        expect(response.body).to include("I will send you the documents to read")
        end
    end
end
