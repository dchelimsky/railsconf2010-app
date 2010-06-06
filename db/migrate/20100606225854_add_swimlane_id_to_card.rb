class AddSwimlaneIdToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :swimlane_id, :integer
  end

  def self.down
    remove_column :cards, :swimlane_id
  end
end
