class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string

    add_column :users, :name, :string

    add_column :users, :email, :string

    add_column :users, :crypted_password, :string

    add_column :users, :persistence_token, :string

    add_column :users, :perishable_token, :string

  end
end
