class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :titulo
      t.text :texto

      t.timestamps
    end
  end
end
