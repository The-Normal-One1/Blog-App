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

        it "displays post's title" do
        # post title is displayed
        expect(page).to have_content(@post.title)
        end

        it "display some of the post's text" do
            # some of the post's text
            expect(page).to have_content(@post.text)
        end

        it "displays the first comments on a post" do
            # some of the post's text
            expect(page).to have_content(@comment.text)
        end

        it "displays pagination content" do
            # some of the post's text
            expect(page).to have_content('Pagination')
        end

        it "displays a link to post's show page" do
            # some of the post's text
            expect(page).to have_link(@post.title, href: user_post_path(user_id: @post.author.id, id: @post.id))
        end

        it 'displays user image' do
            # user image is displayed
            expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
        end
    
        it 'displays the correct content' do
            # correct content is displayed
            expect(page).to have_content(@user.name)
        end

        it 'displays number of posts user has written' do
            # correct content is displayed
            expect(page).to have_content(@user.postsCounter)
        end
    end

end