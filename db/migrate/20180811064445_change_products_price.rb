class ChangeProductsPrice < ActiveRecord::Migration[5.2]
  # def up
  #   change_column :products, :price, :decimal, scale: 2, precision: 10
  # end
  #
  # def down
  #   change_column :products, :price, :decimal, scale: 2, precision: 6
  # end

  #Dont know how to rollback migration can use below way for changing modifers
  def change
    reversible do |dir|
      change_table :products do |t|
        dir.up   { t.change :price, :decimal, scale: 2, precision: 10 }
        dir.down { t.change :price, :decimal, scale: 2, precision: 6 }
      end
    end
  end
end
