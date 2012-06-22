class CreateUsersTweeps < ActiveRecord::Migration
  def change
    create_table :users_tweeps do |t|
      t.integer :user_id
      t.integer :tweep_id

      t.timestamps
    end

    add_index :users_tweeps, [:user_id, :tweep_id]
  end
end
