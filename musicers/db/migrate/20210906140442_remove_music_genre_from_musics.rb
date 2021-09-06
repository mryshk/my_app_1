class RemoveMusicGenreFromMusics < ActiveRecord::Migration[5.2]
  def change
    remove_column :musics, :music_genre, :integer
  end
end
