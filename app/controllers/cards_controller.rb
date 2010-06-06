class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
  
  def new
    @card = Card.new
  end
  
  def create
    Card.create(params[:card])
    redirect_to cards_path
  end
end
