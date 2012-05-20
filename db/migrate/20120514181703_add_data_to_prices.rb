class AddDataToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :description, :text

    add_column :prices, :price, :float

  end
end
