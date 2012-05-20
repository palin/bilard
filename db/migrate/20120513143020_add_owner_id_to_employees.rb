class AddOwnerIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :owner_id, :integer

  end
end
