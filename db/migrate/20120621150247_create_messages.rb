class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :content
      t.integer :event_id

      t.timestamps
    end
  end
end
