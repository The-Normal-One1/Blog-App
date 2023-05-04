# Base class for models in the application.
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # A method that updates the posts counter for a user.
  def update_counter_cache
    author.update(postCounter: author.posts.count)
  end
end
