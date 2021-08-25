class AddMusicGenreToMusics < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :music_genre, :string
  end
end
