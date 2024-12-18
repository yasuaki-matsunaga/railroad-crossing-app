class AddCityIdToCrossings < ActiveRecord::Migration[7.0]
  def change
    add_column :crossings, :city_id, :integer

    add_foreign_key :crossings, :cities, column: :city_id , primary_key: :city_id
  end
end
