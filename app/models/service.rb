class Service < ActiveRecord::Base
	belongs_to :type

	validates :nombre, :resumen, :descripcion, :type_id, presence: true

	has_attached_file :metafora, :styles => { :pequeña => "100x100>", :mediana => "300x300>" }
	validates_attachment_content_type :metafora, :content_type => /\Aimage\/.*\Z/

	
	def self.search(busqueda)
		if busqueda
			where('nombre LIKE ?',"%#{busqueda}%")
		else
			all
		end
	end
end
