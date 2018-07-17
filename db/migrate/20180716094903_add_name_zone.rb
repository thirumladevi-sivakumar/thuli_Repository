class AddNameZone < ActiveRecord::Migration
  def up
  	add_column :zones , :name, :string
  end

  def down
  end
end
