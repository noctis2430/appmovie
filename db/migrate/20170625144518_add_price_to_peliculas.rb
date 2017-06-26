class AddPriceToPeliculas < ActiveRecord::Migration[5.0]
  def change
    add_column :peliculas, :price, :integer
  end
end
