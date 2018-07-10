class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :password
      t.text :address
      t.integer :ward
      t.string :email

      t.timestamps
    end
  end
end
