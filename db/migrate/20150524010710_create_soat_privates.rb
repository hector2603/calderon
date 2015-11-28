class CreateSoatPrivates < ActiveRecord::Migration
  def change
    create_table :soat_privates do |t|
      t.string :vehiculo
      t.string :clase
      t.integer :prima
      t.integer :contribucion
      t.integer :tasa

      t.timestamps
    end
  end
end
