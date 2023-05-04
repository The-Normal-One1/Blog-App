# A comment on belongs to a user and a post.
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
