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
        # @sport = @position.build_sport
      @position = @player.positions.build
      render :layout => "session"
    else
      redirect_to players_path, alert: "You do not have access to add positions for that account."
    end
  end

  def create
    @player = Player.find_by(id: position_params[:current_player_id])

    sport_id = position_params[:sport_id]
    position = Position.find_or_create_by(name: position_params[:name], sport_id: sport_id, player_id: @player.id)

    new_sport = position_params[:sport][:name]

    if !new_sport.empty?
      new_sport_name = Sport.new(name: position_params[:sport][:name])
      if new_sport_name.save
        position.sport = new_sport_name
        @player.positions << position
      end
    end
    redirect_to player_path(@player)

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
      :current_player_id,
      :sport => [:name]
      #sports_attributes:[:sport_id, :sport => [:name]]
    )
  end

end #Ends PositionsController
