class AddColumnsToPeliculas < ActiveRecord::Migration[5.0]
  def change
    add_column :peliculas, :actor, :string
    add_column :peliculas, :genre, :string
  end
end
