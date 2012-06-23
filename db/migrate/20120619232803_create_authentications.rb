class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.string :username
      t.string :avatar
      t.string :refresh_token

      t.timestamps
    end
  end
end
