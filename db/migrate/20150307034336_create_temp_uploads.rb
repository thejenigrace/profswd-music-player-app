class CreateTempUploads < ActiveRecord::Migration
  def change
    create_table :temp_uploads do |t|
      t.integer :song_id

      t.timestamps null: false
    end
  end
end
