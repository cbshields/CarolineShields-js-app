class PositionsController < ApplicationController
before_action :find_position, only: [:show, :edit, :update, :destroy]
  def index
    @player = Player.find(params[:player_id])
  end

  def show
  end

  private
  def find_position
    @position = Position.find(params[:id])
  end



end #Ends PositionsController
