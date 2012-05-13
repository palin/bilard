class RemovePerishableTokenFromOwners < ActiveRecord::Migration
  def up
    remove_column :owners, :perishable_token
      end

  def down
    add_column :owners, :perishable_token, :string
  end
end
