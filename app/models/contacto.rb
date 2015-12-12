class Contacto < ActiveRecord::Base
	validates :nombre, presence: true
	validates :asunto, presence: true
	validates :texto, presence: true
	validates :numero, presence: true
	validates :email , presence: true
	validates :numero, numericality: { only_integer: true }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	after_create :send_mail

	def send_mail
		ContactoMailer.new_contacto(self).deliver
		ContactoMailer.new_contacto_admin(self).deliver
	end
end
