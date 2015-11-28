class MetaforaService < ActiveRecord::Migration
  def self.up
    add_attachment :services, :metafora
  end

  def self.down
    remove_attachment :services, :metafora
  end
end
