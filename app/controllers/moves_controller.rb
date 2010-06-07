class MovesController < ApplicationController
  def create
    card = Card.find(params[:card_id])
    card.update_attributes(params[:card])
    redirect_to cards_path
  end
end
