class StaticsController < ApplicationController

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

	def show
   		@pelicula = Pelicula.find(params[:id])
   	end

	def new
		@pelicula = Pelicula.new
	end

	def create
		@pelicula = Pelicula.new(peli_params)
		if @pelicula.save
			redirect_to peliculas_path, :notice => "Se ha guardado la peli!"
		else
			render "new"
		end
	end

	def edit
		@pelicula = Pelicula.find(params[:id])
	end

	def update
		@pelicula = Pelicula.find(params[:id])
		if @pelicula.update_attributes(peli_params)
			redirect_to peliculas_path, :notice => "exito!"
		else
			render "edit"
		end
	end

	def destroy
		@pelicula = Pelicula.find(params[:id])
		@pelicula.destroy
		redirect_to peliculas_path, :notice => "Borrado"
	end
	private
      def peli_params
         params.require(:pelicula).permit(:name, :stars, :year, :director, :genero, :actor)
      end
	
end
