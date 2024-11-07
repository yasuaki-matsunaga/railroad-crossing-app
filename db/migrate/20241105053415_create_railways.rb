class CreateRailways < ActiveRecord::Migration[7.0]
  def change
    create_table :railways, id: false do |t|
      t.bigint :railway_id, null: false, primary_key: true
      t.string :railway_name

      t.timestamps
    end
  end
end
