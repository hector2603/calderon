class Article < ActiveRecord::Base
	
	validates :titulo, presence: true
	validates :resumen, presence: true
	validates :body, presence: true

	has_attached_file :cover, :styles => { :medium => "720x420>", :thumb => "300x300>" }
	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/


	def self.search(busqueda)
		if busqueda
			where('titulo LIKE ?',"%#{busqueda}%")
		else
			all
		end
	end
	
end
