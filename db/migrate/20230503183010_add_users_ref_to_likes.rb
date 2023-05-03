# frozen_string_literal: true

# Add a reference to the users table to the likes table.
class AddUsersRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, index: true, foreign_key: { to_table: :users }
  end
end
