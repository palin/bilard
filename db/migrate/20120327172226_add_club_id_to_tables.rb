class AddClubIdToTables < ActiveRecord::Migration
  def change
    add_column :tables, :club_id, :integer

  end
end
