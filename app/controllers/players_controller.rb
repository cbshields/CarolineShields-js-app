class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    if @player.save
      redirect_to player_path(@player)
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    if @player.save
      redirect_to player_path(@player)
    else
      render :edit
    end

  end

  private
  def player_params
    params.require(:player).permit(
      :name,
      :password,
      :age,
      :address,
      sport_ids:[],
      sports_attributes: [:name],
      position_ids:[],
      positions_attributes: [:name])
  end
end
