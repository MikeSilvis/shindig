class AddRestnameToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :name, :string
  end
end
