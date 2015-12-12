class ContactoMailer < ActionMailer::Base
  default from: "admin@gmail.com"

  def new_contacto(contac)
  	@contacto = contac

  	mail(to: @contacto.email, subject: "Calderón Gonzaléz")

  end

  def new_contacto_admin(contac)
  	@contacto =  contac
  	User.all.each do |u|
	  	mail(to: u.email, subject: "Nuevo mensaje")
  	end
  end

end
