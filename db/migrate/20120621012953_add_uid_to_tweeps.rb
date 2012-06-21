class AddUidToTweeps < ActiveRecord::Migration
  def change
    add_column :tweeps, :uid, :integer
  end
end
