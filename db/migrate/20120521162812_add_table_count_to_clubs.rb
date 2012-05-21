class AddTableCountToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :table_count, :integer

  end
end
