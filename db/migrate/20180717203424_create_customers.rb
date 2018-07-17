class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email

      t.timestamps
    end

    add_index :customers, :email,                unique: true
  end
end
