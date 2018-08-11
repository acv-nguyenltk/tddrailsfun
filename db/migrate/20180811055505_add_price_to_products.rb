class AddPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price, :decimal, scale: 2, precision: 6
    add_column :products, :published, :boolean
    add_column :products, :short_description, :string
  end
end
