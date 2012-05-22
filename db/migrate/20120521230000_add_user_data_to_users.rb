class AddUserDataToUsers < ActiveRecord::Migration
  def change

    add_column :users, :surname, :string

    add_column :users, :birthday, :datetime

    add_column :users, :city, :string

    add_column :users, :description, :text

    add_column :users, :best_club, :integer

    add_column :users, :picture, :string

  end
end
