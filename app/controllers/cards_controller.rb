class CardsController < ApplicationController
  def index
    @swimlanes = Swimlane.all
  end
  
  def new
    @card = Card.new
  end
  
  def create
    Card.create(params[:card])
    redirect_to cards_path
  end
  
  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end
  
  def update
    @card = Card.find(params[:id])
    @card.update_attributes(params[:card])
    redirect_to card_path(@card)
  end
end
