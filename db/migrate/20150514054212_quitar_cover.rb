class QuitarCover < ActiveRecord::Migration
  def change
  	remove_attachment :articles, :cover
  end
end
