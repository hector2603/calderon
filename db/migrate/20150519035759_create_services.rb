class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :type, index: true
      t.string :nombre
      t.text :resumen
      t.text :descripcion

      t.timestamps
    end
  end
end
