class RemoveLoginFromOwners < ActiveRecord::Migration
  def up
    remove_column :owners, :login
      end

  def down
    add_column :owners, :login, :string
  end
end
