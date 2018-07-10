class CreateBrandlists < ActiveRecord::Migration
  def change
    create_table :brandlists do |t|
      t.string :brandName
      t.integer :quantity
      t.integer :Price

      t.timestamps
    end
  end
end
