class AddPhoneToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :phone, :string

  end
end
