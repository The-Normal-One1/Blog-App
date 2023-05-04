# A like belongs to a user and a post.
class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :update_like_counter_cache

  private 

  # A method that updates the likes counter for a post.
  def update_like_counter_cache
    post.update(likesCounter: post.likes.count)
  end
end
