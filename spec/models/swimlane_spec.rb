require 'spec_helper'

describe Swimlane do
  describe "default scope" do
    it "orders by position" do
      Swimlane.create(:name => "second", :position => 2)
      Swimlane.create(:name => "first", :position => 1)
      Swimlane.create(:name => "third", :position => 3)
      Swimlane.all.map(&:name).should ==  %w[first second third]
    end
  end
end
