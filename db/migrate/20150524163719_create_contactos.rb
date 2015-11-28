class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.string :asunto
      t.text :texto
      t.string :numero

      t.timestamps
    end
  end
end
