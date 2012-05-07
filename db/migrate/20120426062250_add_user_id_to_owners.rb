class AddUserIdToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :user_id, :integer

  end
end
