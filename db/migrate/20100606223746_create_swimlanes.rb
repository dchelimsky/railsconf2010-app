class CreateSwimlanes < ActiveRecord::Migration
  def self.up
    create_table :swimlanes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :swimlanes
  end
end
