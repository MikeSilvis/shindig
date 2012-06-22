class CreateTwitterFollowers < ActiveRecord::Migration
  def change
    create_table :tweeps do |t|
      t.string :username
      t.string :avatar
      t.string :name
      t.integer :user_id
      t.integer :uid
      t.timestamps
    end
  end
end
