require "rails_helper"

RSpec.describe "Posts with Authetication", type: :request do 
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:user_post) { create(:user) }
    let!(:other_user_post) { create(:user) }



    describe "GET /posts/{id}" do
        context "with valid auth" do
            context "When requesting other's author post" do

            end
            context "When requesting author's post" do

            end
        end
    end

    describe "POST /posts" do

    end

    describe "PUT /posts" do

    end


        # it "should return OK, with no data in the DB" do
        #     get '/posts'
        #     payload = JSON.parse(response.body)
        #     expect(payload) .to be_empty
        #     expect(response) .to have_http_status(200)
        # end
end