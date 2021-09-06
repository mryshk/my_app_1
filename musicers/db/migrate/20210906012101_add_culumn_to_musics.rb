class AddCulumnToMusics < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :rate, :float
  end
end
