# frozen_string_literal: true

# A post belongs to a user and has many comments and likes.
class AddPostRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, index: true, foreign_key: { to_table: :posts }
  end
end
