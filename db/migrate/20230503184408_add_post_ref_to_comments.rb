# frozen_string_literal: true

class AddPostRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, index: true, foreign_key: { to_table: :posts }
  end
end
