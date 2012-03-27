class AddEncryptPasswordToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :encrypt_password, :string

  end
end
