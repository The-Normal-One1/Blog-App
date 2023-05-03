# A user has many posts, comments, and likes.
class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
end
