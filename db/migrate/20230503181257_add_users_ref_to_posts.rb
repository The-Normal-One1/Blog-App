# frozen_string_literal: true

# A post belongs to a user and has many comments and likes.
class AddUsersRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, index: true, foreign_key: { to_table: :users }
  end
end
