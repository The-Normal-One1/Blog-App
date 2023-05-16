require 'rails_helper'

RSpec.describe 'Users', type: :system do
  # index page

  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'Ermiyas', photo: 'https://picsum.photos/200/300', bio: 'I am a software engineer',
                          postsCounter: 0)
      @post = Post.create(title: 'This is my first post!!', text: 'I like it!!', author_id: @user.id, commentsCounter: 0,
                          likesCounter: 0)
      @comment = Comment.create(text: 'I enjoyed watching football games!!', author_id: @user.id,
                                post_id: @post.id)
      visit users_path
    end

    it 'displays the correct header' do
      # correct header is displayed
      expect(page).to have_content('List all Users')
    end

    it 'displays the correct content' do
      # I can see the username of all other users.
      expect(page).to have_content(@user.name)
    end

    it 'displays the correct image for each user' do
      # I can see the profile picture for each user.
      expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
    end

    it 'display number of posts for each user' do
      # I can see the number of posts each user has written.
      expect(page).to have_content(@user.postsCounter)
    end


    it 'displays the correct links' do
      # When I click on a user, I am redirected to that user's show page.
      expect(page).to have_link(@user.name, href: user_path(@user))
    end
  end
end
