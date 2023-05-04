# frozen_string_literal: true

# A like belongs to a user and a post.
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
