class CreateMusics < ActiveRecord::Migration[5.0]
  def change
    create_table :musics do |t|
      t.integer :user_id
      t.string :musicimage_id
      t.string :music_name
      t.text :music_url
      t.text :music_caption

      t.timestamps
    end
  end
end
