class RenameVenzonWardId < ActiveRecord::Migration
  def up
  	rename_column :vendors_zones ,:ward_id ,:zone_id
  end

  def down
  end
end
