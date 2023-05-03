# Base class for models in the application.
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
end
