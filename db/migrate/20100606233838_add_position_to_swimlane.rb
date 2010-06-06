class AddPositionToSwimlane < ActiveRecord::Migration
  def self.up
    add_column :swimlanes, :position, :integer
  end

  def self.down
    remove_column :swimlanes, :position
  end
end
