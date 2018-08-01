class PositionsController < ApplicationController
before_action :find_position, only: [:show,:edit, :update, :destroy]
before_action :find_player, only: [:index, :edit]

  def index
  end

  def show
  end

  def edit
  end

  def update

  end

  private
  def find_position
    @position = Position.find(params[:id])
  end

  def find_player
    @player = Player.find(params[:player_id])
  end

end #Ends PositionsController
