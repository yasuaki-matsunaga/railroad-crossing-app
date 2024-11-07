class CreateCrossingCities < ActiveRecord::Migration[7.0]
  def change
    create_table :crossing_cities, id: false do |t|
      t.bigint :crossing_id
      t.integer :city_id

      t.timestamps
    end
    add_foreign_key :crossing_cities, :crossings, column: :crossing_id , primary_key: :crossing_id
    add_foreign_key :crossing_cities, :cities, column: :city_id , primary_key: :city_id
  end
end
