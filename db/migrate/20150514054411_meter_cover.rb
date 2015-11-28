class MeterCover < ActiveRecord::Migration
  def self.up
    add_attachment :articles, :cover
  end

  def self.down
    remove_attachment :articles, :cover
  end
end
