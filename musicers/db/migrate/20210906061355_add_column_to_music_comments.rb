class AddColumnToMusicComments < ActiveRecord::Migration[5.2]
  def change
    add_column :music_comments, :post_rate, :float
  end
end
