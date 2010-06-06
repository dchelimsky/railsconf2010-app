class Swimlane < ActiveRecord::Base
  has_many :cards

  def self.default
    find_by_default(true)
  end
end
