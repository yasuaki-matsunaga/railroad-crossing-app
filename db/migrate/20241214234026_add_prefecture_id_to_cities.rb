class AddPrefectureIdToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :prefecture_id, :integer

    add_foreign_key :cities, :prefectures, column: :prefecture_id , primary_key: :prefecture_id
  end
end
