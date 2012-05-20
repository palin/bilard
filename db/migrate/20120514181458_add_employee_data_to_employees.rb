class AddEmployeeDataToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :name, :string

    add_column :employees, :surname, :string

    add_column :employees, :last_login, :string

    add_column :employees, :last_logout, :string

  end
end
