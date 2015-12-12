class AddColumnContacto < ActiveRecord::Migration
  def change
  	add_column :contactos, :email, :email_address
  end
end
