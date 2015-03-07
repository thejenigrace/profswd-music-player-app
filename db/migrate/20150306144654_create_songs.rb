class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :playlist_id
      t.string :title
      t.string :artist
      t.string :key

      t.timestamps null: false
    end
  end
end
