class RemovePersistenceTokenFromOwners < ActiveRecord::Migration
  def up
    remove_column :owners, :persistence_token
      end

  def down
    add_column :owners, :persistence_token, :string
  end
end
