class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures, id: false do |t|
      t.integer :prefecture_id, null: false, primary_key: true
      t.string :prefecture_name, null: false

      t.timestamps
    end
  end
end
