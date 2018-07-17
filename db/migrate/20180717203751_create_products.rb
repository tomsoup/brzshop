class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ""
      t.integer :price, default: 0
      t.integer :qty, default: 0

      t.timestamps
    end
  end
end
