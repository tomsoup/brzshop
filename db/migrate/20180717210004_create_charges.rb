class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.boolean :paid, default: false
      t.integer :amount, default: 0
      t.string :currency, default: 'usd'
      t.boolean :refunded, default: false
      t.references :order, foreign_key: true
      t.boolean :disputed, default: false

      t.timestamps
    end
  end
end
