# Remove column postId from table likes
class RemovePostIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :postId, :integer
  end
end
