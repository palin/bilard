class AddClubDataToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :name, :string

    add_column :clubs, :street, :string

    add_column :clubs, :city, :string

    add_column :clubs, :post_code, :string

    add_column :clubs, :description, :text

  end
end
