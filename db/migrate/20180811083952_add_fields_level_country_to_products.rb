class AddFieldsLevelCountryToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :level , :integer, limit: 1
    add_column :products, :country, :string, limit: 3
  end
end
