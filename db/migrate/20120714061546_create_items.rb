class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :quantity
      t.integer :category_id
      t.integer :event_id
      t.integer :user_id
      t.timestamps
    end
  end
end
