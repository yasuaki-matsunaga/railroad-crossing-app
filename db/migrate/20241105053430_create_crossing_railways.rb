class CreateCrossingRailways < ActiveRecord::Migration[7.0]
  def change
    create_table :crossing_railways, id: false do |t|
      t.bigint :crossing_id
      t.bigint :railway_id

      t.timestamps
    end
    add_foreign_key :crossing_railways, :crossings, column: :crossing_id , primary_key: :crossing_id
    add_foreign_key :crossing_railways, :railways, column: :railway_id , primary_key: :railway_id
  end
end
