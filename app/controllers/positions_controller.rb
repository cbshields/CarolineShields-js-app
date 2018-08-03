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
    @position = @player.positions.build
    @sport = @position.build_sport
    render :layout => "session"
  end

  def create
    @player = Player.find_by(name: position_params[:player])
    new_position = position_params[:name]
    sport_id = position_params[:sport_id]
    new_sport = position_params[:sport][:name]

    position = Position.find_or_create_by(name: new_position)
    if !new_sport
      new_sport = Sport.new(name: position_attributes[:sport][:name])
    end
    new_sport = Sport.new(name: position_attributes[:sport][:name])
    @position = Position.create

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
      :player,
      :name,
      :sport_id,
      :sport => [:name]
      #sports_attributes:[:sport_id, :sport => [:name]]
    )
  end

end #Ends PositionsController
