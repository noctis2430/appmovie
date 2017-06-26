class SelectMoviesController < ApplicationController

	before_action :authenticate_user!

  def index
  	@peliculas = Pelicula.all
  	if params[:search]
  		@peliculas = Pelicula.search(params[:search]).order("created_at DESC")
  	elsif params[:search_year]
  		@peliculas = Pelicula.search_year(params[:search_year])
  	elsif params[:search_genero]
  		@peliculas = Pelicula.search_genero(params[:search_genero])
  	else
  		@peliculas = Pelicula.all.order('created_at DESC')
  	end
  end
end
