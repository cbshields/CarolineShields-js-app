class SportsController < ApplicationController
  def index
    if params[:player_id]
      @player = Player.find_by(id: params[:player_id])
      if @player.nil?
        redirect_to players_path, alert: "Player not found"
      else
        @sports = @player.sports
        respond_to do |f|
          f.html {render :index}
          f.json {render json: @sports}
        end
      end
    else
      @sports = Sport.all
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @sports}
      end

    end
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.create(sport_params)
    if @sport.save
      redirect_to sport_path(@sport)
    else
      render :new
    end
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    @sport.update(sport_params)
    if @sport.save
      redirect_to sport_path(@sport)
    else
      render :edit
    end
  end


  private
  def sport_params
      params.require(:sport).permit(:name)
  end

  def find_player
    @player = Player.find(params[:player_id])
  end
end
