require 'spec_helper'

describe MovesController do
  describe "POST create" do
    it "moves the card to the submitted swimlane" do
      card = stub_model(Card, :id => "37")
      Card.stub(:find) { card }
      card.should_receive(:update_attributes).with("swimlane_id" => "42")
      post :create, :card_id => "37", :card => {"swimlane_id" => "42"}
    end
    
    it "redirects to the cards page" do
      Card.stub(:find) { stub_model(Card) }
      post :create, :card => {}
      response.should redirect_to(cards_path)
    end
  end
end
