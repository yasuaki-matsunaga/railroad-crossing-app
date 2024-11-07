class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities, id: false do |t|
      t.integer :city_id, null: false, primary_key: true
      t.string :city_name, null: false

      t.timestamps
    end
  end
end
