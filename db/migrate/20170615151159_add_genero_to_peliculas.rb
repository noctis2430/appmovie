class AddGeneroToPeliculas < ActiveRecord::Migration[5.0]
  def change
    add_column :peliculas, :genero, :string
  end
end
