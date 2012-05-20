class AddClubCountToOwner < ActiveRecord::Migration
  def change
    add_column :owners, :club_count, :integer

  end
end
