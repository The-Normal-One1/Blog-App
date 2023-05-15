require 'rails_helper'

RSpec.describe 'Users', type: :system do
     # show page

     describe 'show page' do 
        before(:each) do
            @user = User.create(name: 'Ermiyas', photo: 'https://picsum.photos/200/300', bio: 'I am a software engineer',
                                postsCounter: 0)
            @post = Post.create(title: 'This is my first post!!', text: 'I like it!!', author_id: @user.id, commentsCounter: 2,
                                likesCounter: 0)
             @comment = Comment.create(text: 'I enjoyed watching football games!!', author_id: @user.id, post_id: @post.id)
            visit user_path(@user)
        end

        it 'displays the correct image for each user' do
            # correct image is displayed
            expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
        end

        it 'displays the username of each user' do
            # correct header is displayed
            expect(page).to have_content(@user.name)
        end

        it 'display number of posts for each user' do
            # correct number of posts is displayed
            expect(page).to have_content(@user.postsCounter)
        end

        it "displays user's bio" do
            # correct content is displayed
            expect(page).to have_content(@user.bio)
        end

        it "The user's first 3 posts are displayed" do
            # correct content is displayed
            @user.recent_posts.each do |post|
                expect(page).to have_content(post.title)
            end
        
        end
    end
end