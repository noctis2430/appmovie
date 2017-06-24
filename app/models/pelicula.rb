class Pelicula < ApplicationRecord
	belongs_to :language
	belongs_to :country
	belongs_to :genre

	def self.search(search)
  		where("actor like ?", "%" + "%#{search}%" + "%")
	end
	def self.search_year(search_year)
		where(year: search_year)
	end
	def self.search_genero(search_genero)
		where("genero like ?", "%" + "%#{search_genero}%" + "%")
	end
end
