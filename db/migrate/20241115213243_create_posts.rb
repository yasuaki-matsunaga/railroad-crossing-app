class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.bigint :crossing_id
      t.string :title, null: false
      t.text :body, null: false
      t.string :crossing_image

      t.timestamps
    end
    add_foreign_key :posts, :crossings, column: :crossing_id , primary_key: :crossing_id
  end
end
