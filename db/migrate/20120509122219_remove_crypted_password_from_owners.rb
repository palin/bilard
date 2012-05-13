class RemoveCryptedPasswordFromOwners < ActiveRecord::Migration
  def up
    remove_column :owners, :crypted_password
      end

  def down
    add_column :owners, :crypted_password, :string
  end
end
