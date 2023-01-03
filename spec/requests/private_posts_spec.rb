require "rails_helper"

RSpec.describe "Posts with Authetication", type: :request do 
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:user_post) { create(:post, user_id: user.id) }
    let!(:other_user_post) { create(:post, user_id: other_user.id, published: true) }
    let!(:other_user_post_draft) { create(:post, user_id: other_user.id, published: false) }
    let!(:auth_headers) { { 'Authorization' => "Bearer #{user.auth_token}"} }
    let!(:other_auth_header) { { 'Authorization' => "Bearer #{other_user.auth_token}"} }
    # Authorization: Bearer xxxxxxxx



    describe "GET /posts/{id}" do
        context "with valid auth" do
            context "When requesting other's author post" do
                context "When the post is public" do
                    before { get "/posts/#{other_user_post.id}", headers: auth_headers}
                    
                    context "payload" do
                        subject { JSON.parse(response.body) }
                        it {is.expected.to include(id) }
                    end
                    context "response" do
                        subject { response }
                        it {is.expected.to have_http_status(:ok) }
                    end
                end
                

                context "When the post is draft" do
                    before { get "/posts/#{other_user_post_draft.id}", headers: auth_headers}
                    
                    context "payload" do
                        subject { JSON.parse(response.body) }
                        it {is.expected.to include(error) }
                    end
                    context "response" do
                        subject { response }
                        it {is.expected.to have_http_status(:not_found) }
                    end
                end  
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