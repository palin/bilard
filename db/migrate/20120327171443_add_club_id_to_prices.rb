class AddClubIdToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :club_id, :integer

  end
end
