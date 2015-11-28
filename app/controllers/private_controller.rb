class PrivateController < ApplicationController
	before_action :crear_admin
	before_action :authenticate_user! 
	def index

  	end

  	def crear_admin
  		
  		if User.exists?(email: 'admin@gmail.com')
	  		print "Ya existe"	
	  	else
	  		@usuario = User.new(email: 'admin@gmail.com', password: '123456789',password_confirmation: '123456789')
	  		sign_in @usuario
	  		sign_in @usuario, :bypass => true 
  		end 
  	end

end
