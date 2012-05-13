class RemoveEncryptPasswordFromOwners < ActiveRecord::Migration
  def up
    remove_column :owners, :encrypt_password
      end

  def down
    add_column :owners, :encrypt_password, :string
  end
end
