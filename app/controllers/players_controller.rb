class PlayersController < ApplicationController
before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    binding.pry
    player_params = player_params[:player]
    sports_params = player_params[:sports]

    @sport = Sport.create(sports_params)
    @player = Player.create(player_params)
    Position.create(sport_id: @sport.id, player_id: @player.id)
    if @player.save
      redirect_to player_path(@player)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @player.update(player_params)
    if @player.save
      redirect_to player_path(@player)
    else
      render :edit
    end

  def destroy
    @player.delete
    redirect_to players_path
  end


end #ends Controller

  private
  def player_params
    params.require(:player).permit(
      :name,
      :password_digest,
      :age,
      :address,
      sport_ids:[],
      sports_attributes: [:name],
      position_ids:[],
      positions_attributes: [:name])
  end

  def find_user
    @player = Player.find(params[:id])
  end
end
