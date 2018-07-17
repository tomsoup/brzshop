class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total, default: 0
      t.integer :tax, default: 0
      t.integer :status, default: 0
      t.references :customer, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
