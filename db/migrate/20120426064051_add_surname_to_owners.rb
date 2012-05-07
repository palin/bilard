class AddSurnameToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :surname, :string

  end
end
