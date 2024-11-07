class CreateCrossings < ActiveRecord::Migration[7.0]
  def change
    create_table :crossings, id: false do |t|
      t.bigint :crossing_id, null: false, primary_key: true
      t.decimal :latitude, precision: 11, scale: 8, null: false
      t.decimal :longitude, precision: 11, scale: 8, null: false
      t.string :crossing_name

      t.timestamps
    end
  end
end
