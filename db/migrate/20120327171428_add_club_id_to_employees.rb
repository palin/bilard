class AddClubIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :club_id, :integer

  end
end
