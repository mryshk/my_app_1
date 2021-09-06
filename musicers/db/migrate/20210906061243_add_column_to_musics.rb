class AddColumnToMusics < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :artist_name, :string
  end
end
