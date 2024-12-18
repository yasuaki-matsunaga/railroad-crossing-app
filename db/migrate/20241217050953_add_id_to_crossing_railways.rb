class AddIdToCrossingRailways < ActiveRecord::Migration[7.0]
  def change
    add_column :crossing_railways, :id, :primary_key
  end
end
