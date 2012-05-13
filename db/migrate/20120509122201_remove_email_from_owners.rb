class RemoveEmailFromOwners < ActiveRecord::Migration
  def up
    remove_column :owners, :email
      end

  def down
    add_column :owners, :email, :string
  end
end
