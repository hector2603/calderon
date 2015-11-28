class CreateBuscars < ActiveRecord::Migration
  def change
    create_table :buscars do |t|

      t.timestamps
    end
  end
end
