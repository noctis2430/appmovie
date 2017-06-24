class RemoveGenreFromPeliculas < ActiveRecord::Migration[5.0]
  def change
    remove_column :peliculas, :genre, :string
  end
end
