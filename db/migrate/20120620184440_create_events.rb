class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.string :street
      t.string :state
      t.integer :zipcode
      t.string :city
      t.string :token

      t.timestamps
    end
  end
end
