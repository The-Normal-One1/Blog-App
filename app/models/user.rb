# A user has many posts, comments, and likes.
class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes


  # A method to return a recent list of posts by this user
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
