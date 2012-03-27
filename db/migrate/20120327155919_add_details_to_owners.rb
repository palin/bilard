class AddDetailsToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :login, :string

    add_column :owners, :name, :string

    add_column :owners, :email, :string

    add_column :owners, :crypted_password, :string

    add_column :owners, :persistence_token, :string

    add_column :owners, :perishable_token, :string

  end
end
