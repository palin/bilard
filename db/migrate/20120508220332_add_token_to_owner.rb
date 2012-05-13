class AddTokenToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :token, :string

  end
end
