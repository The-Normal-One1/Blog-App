require 'rails_helper'

RSpec.describe 'Posts', type: :system do

    # index page
    
    describe 'index page' do
        before(:each) do
        @user = User.create(name: 'Ermiyas', photo: 'https://picsum.photos/200/300', bio: 'I am a software engineer',
                            postsCounter: 0)
        @post = Post.create(title: 'This is my first post!!', text: 'I like it!!', author_id: @user.id, commentsCounter: 0,
                            likesCounter: 0)
        @comment = Comment.create(text: 'I enjoyed watching football games!!', author_id: @user.id, post_id: @post.id)
        visit user_posts_path(@user)
        end

        it 'displays user image' do
        # user image is displayed
        expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
        end
    end

end