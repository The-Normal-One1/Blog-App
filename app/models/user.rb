# A user has many posts, comments, and likes.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :postsCounter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true },
                           allow_nil: true

  # Role-based authorization
  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  # A method to return a recent list of posts by this user
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
