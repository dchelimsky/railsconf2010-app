class Card < ActiveRecord::Base
  belongs_to :swimlane

  before_create :ensure_swimlane
  
private

  def ensure_swimlane
    self.swimlane ||= (Swimlane.default || raise("No default swimlane"))
  end
end
