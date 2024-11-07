class CreateCrossingPrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :crossing_prefectures, id: false do |t|
      t.bigint :crossing_id
      t.integer :prefecture_id

      t.timestamps
    end
    add_foreign_key :crossing_prefectures, :crossings, column: :crossing_id , primary_key: :crossing_id
    add_foreign_key :crossing_prefectures, :prefectures, column: :prefecture_id , primary_key: :prefecture_id
  end
end
