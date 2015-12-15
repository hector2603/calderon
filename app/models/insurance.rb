class Insurance < ActiveRecord::Base
	validates :nombre, :resumen, :descripcion, presence: true
	validates :nombre, length: { in: 1..75 , message: "debe tener entre 1 y 75 caracteres"}
	validates :resumen, length: { in: 1..1000 , message: "debe tener entre 1 y 1000 caracteres"}
	validates :descripcion, length: { in: 1..10000 , message: "debe tener entre 1 y 10000 caracteres"}

	
	def self.search(busqueda)
		if busqueda
			where('nombre LIKE ?',"%#{busqueda}%")
		else
			all
		end
	end
end
