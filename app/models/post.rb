# Base class for models in the application.
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_save :update_post_counter_cache

  # A method to return a recent list of comments on this post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  # A method that updates the posts counter for a user.
  def update_post_counter_cache
    author.update(postsCounter: author.posts.count)
  end
end
