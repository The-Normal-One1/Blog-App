require 'rails_helper'

RSpec.describe 'Posts', type: :system do

    # show page

    describe 'show page' do

        before(:each) do
            @user = User.create(name: 'Ermiyas', photo: 'https://picsum.photos/200/300', bio: 'I am a software engineer',
                                postsCounter: 0)
            @post = Post.create(title: 'This is my first post!!', text: 'I like it!!', author_id: @user.id, commentsCounter: 0, likesCounter: 0)
            @comment = Comment.create(text: 'I enjoyed watching football games!!', author_id: @user.id, post_id: @post.id)
            visit user_post_path(user_id: @post.author.id, id: @post.id)
        end

        it "displays the post's title" do
            # post title is displayed
            expect(page).to have_content(@post.title)
        end

    end


end