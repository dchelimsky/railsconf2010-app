require 'spec_helper'

describe Card do
  context "created with no explicit swimlane" do
    context "with an existing default swimlane" do
      it "assigns itself to the default swimlane" do
        backlog = Swimlane.create!(:name => "backlog", :default => true)
        Swimlane.create!(:name => "in progress", :default => false)
      
        card = Card.create!(:title => "ignore")
      
        card.swimlane.should eq(backlog)
      end
    end
    
    context "with no default swimlane" do
      it "raises an error saying 'No default swimlane'" do
        expect do
          Card.create!(:title => "ignore")
        end.to raise_error(/No default swimlane/)
      end
    end
  end
end