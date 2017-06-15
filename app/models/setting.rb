class Setting < ApplicationRecord
  belongs_to :user
  validates :country, :language, length: {minimum: 2, message: "Dos caracters o mas"}
  validates :country, presence: { message: "No has puesto pais"}
  validates :language, presence: { message: "No has puesto idioma"}
end
