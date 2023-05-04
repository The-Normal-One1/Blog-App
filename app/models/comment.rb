# A comment on belongs to a user and a post.
class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  # A method that updates the comments counter for a post.
  def update_counter_cache
    post.update(commentCounter: post.comments.count)
  end
end
