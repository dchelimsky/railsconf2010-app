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
end
