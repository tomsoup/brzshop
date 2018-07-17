class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :subtotal, default: 0
      t.integer :status, default: 0
      t.integer :products_qty, default: 0
      t.references :customer, foreign_key: true


      t.timestamps
    end
  end
end
