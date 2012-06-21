class RenameTwitterFollowersToTweeps < ActiveRecord::Migration
  def change
    rename_table :twitter_followers, :tweeps
  end
end
