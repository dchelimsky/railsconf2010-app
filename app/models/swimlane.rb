class Swimlane < ActiveRecord::Base
  has_many :cards
  default_scope :order => :position

  def self.default
    find_by_default(true)
  end
end
