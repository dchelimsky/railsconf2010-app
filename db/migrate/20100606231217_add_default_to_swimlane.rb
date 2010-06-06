class AddDefaultToSwimlane < ActiveRecord::Migration
  def self.up
    add_column :swimlanes, :default, :boolean
  end

  def self.down
    remove_column :swimlanes, :default
  end
end
