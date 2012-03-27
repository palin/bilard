class AddOwnerIdToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :owner_id, :integer

  end
end
