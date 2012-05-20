class AddOwnerIdToTables < ActiveRecord::Migration
  def change
    add_column :tables, :owner_id, :integer

  end
end
