class AddBodyToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :body, :text
  end

  def self.down
    remove_column :cards, :body
  end
end
