class CreateTwitterFollowers < ActiveRecord::Migration
  def change
    create_table :twitter_followers do |t|
      t.string :username
      t.string :avatar
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
