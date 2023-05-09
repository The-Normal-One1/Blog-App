require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe "GET /users" do
        it "returns http success" do
        get "/users"
        #test for http response status
        expect(response).to have_http_status(:success)
        expect(response).to have_http_status(200)
        expect(response.status).to eq(200)
        #correct response is rendered
        expect(response).to render_template(:index)
        # include correct placeholders
        expect(response.body).to include("Users")
        expect(response.body).to include("Ermiyas")
        expect(response.body).to include("Tom")
        end
    end

    describe "GET /users/:id" do
        it "returns http success" do
        get "/users/1"
        #test for http response status
        expect(response).to have_http_status(:success)
        expect(response).to have_http_status(200)
        expect(response.status).to eq(200)
        #correct response is rendered
        expect(response).to render_template(:show)
        # include correct placeholders
        expect(response.body).to include("Tom")
        end
    end
end