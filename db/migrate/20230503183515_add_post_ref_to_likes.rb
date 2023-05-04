# frozen_string_literal: true

# Add a reference to the users table to the likes table.
class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, index: true, foreign_key: { to_table: :posts }
  end
end
