require 'spec_helper'

describe CardsController do
  describe "GET index" do
    it "assigns all cards to @cards" do
      card = stub_model(Card)
      Card.stub(:all) { [card] } 
      get :index
      assigns(:cards).should eq([card])
    end
  end
  
  describe "GET new" do
    it "assigns a new Card to @card" do
      get :new
      assigns(:card).should be_a_new(Card)
    end
  end
  
  describe "POST create" do
    it "creates a new card" do
      Card.should_receive(:create).with("title" => "Hello")
      post :create, :card => {"title" => "Hello"}
    end

    it "redirects to the index page" do
      post :create
      response.should redirect_to(cards_path)
    end
  end
  
  describe "GET show" do
    it "assigns requested Card to @card" do
      card = stub_model(Card)
      Card.stub(:find).with("37") { card }
      get :show, :id => "37"
      assigns(:card).should eq(card)
    end
  end
  
  describe "GET edit" do
    it "assigns requested Card to @card" do
      card = stub_model(Card)
      Card.stub(:find).with("37") { card }
      get :edit, :id => "37"
      assigns(:card).should eq(card)
    end
  end
  
  describe "PUT update" do
    let(:card) {stub_model(Card, :id => "37")}
    before {Card.stub(:find).with("37") { card }}

    it "updates the record" do
      card.should_receive(:update_attributes).with(
        hash_including("body" => "Update me"))
      put :update, :id => "37", :card => {"body" => "Update me"}
    end

    it "redirects to the updated card" do
      put :update, :id => "37"
      response.should redirect_to(card_path(card))
    end
  end
end
