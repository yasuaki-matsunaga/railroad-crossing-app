class CreateCrossingFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :crossing_favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crossing, null: false, type: :bigint, foreign_key: { to_table: :crossings, primary_key: :crossing_id }

      t.timestamps
    end
    add_index :crossing_favorites, [:user_id, :crossing_id], unique: true
  end
end
