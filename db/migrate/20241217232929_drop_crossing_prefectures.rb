class DropCrossingPrefectures < ActiveRecord::Migration[7.0]
  def change
    drop_table :crossing_prefectures
  end
end
