class PositionsController < ApplicationController
before_action :find_position, only: [:show,:edit, :update, :destroy]
before_action :find_player, only: [:index, :edit]

  def index
    if params[:player_id]
      @player = Player.find_by(id: params[:player_id])
      if @player.nil?
        redirect_to players_path, alert: "Player not found"
      else
        @positions = @player.positions
      end
    else
      @positions = Position.all

    end
  end

  def show
  end

  def new
    @player = Player.find_by(id: params[:player_id])
    if @player.id == session["user_id"]
      @position = @player.positions.build
      render :layout => "session"
    else
      redirect_to players_path, alert: "You do not have access to add positions for that account."
    end
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      redirect_to player_path(current_player)
    end
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

  def position_params
    params.require(:position).permit(
      :name,
      :sport_id,
      :player_id,
      sport_attributes:[:name]
    )
  end

end #Ends PositionsController
