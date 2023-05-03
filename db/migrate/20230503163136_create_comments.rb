# frozen_string_literal: true

# A post belongs to a user and has many likes and comments.
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text

      t.timestamps
    end
  end
end
