class AddReferenceToCategoriesInProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :category, index: true
    # add_reference :products, :category, foreign_key: true
  end
end
