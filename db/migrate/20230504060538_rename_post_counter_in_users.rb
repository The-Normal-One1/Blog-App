class RenamePostCounterInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :postCounter, :postsCounter
  end
end
