class PlayersController < ApplicationController
before_action :sign_in_user, only: [:index, :show, :edit, :update, :destroy]
before_action :find_user, only: [:edit, :update, :destroy]


  def index
    @players = Player.all
    @over_18 = Player.over_18
    @under_18 = Player.under_18
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @players}
    end

  end

  def new
    @player = Player.new(name: session[:tmpname], uid: session[:uid])
      5.times do
        @position = @player.positions.build
        @sport = @position.build_sport
      end

    render :layout => "session"
  end

  def create
    @player = Player.create(player_params)
    @player.uid = session[:uid]
    if @player.save

      session[:user_id] = @player.id
      redirect_to player_path(@player)
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @player}
    end
  end

  def edit
    1.times do
      @position = @player.positions.build
      @sport = @position.build_sport
    end
    render :layout => "session"
  end

  def update

    @player.update(player_params)

    if @player.save
      redirect_to player_path(@player)
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.id == session["user_id"]
      session.delete("user_id")
      @player.delete
      redirect_to root_url
    else
      redirect_to players_path, alert: "You do not have access to delete that account."
    end

  end

 #ends Controller

  private
  def player_params
    params.require(:player).permit(
      :name,
      :password,
      :password_confirmation,
      :age,
      :address,
      :uid,
      positions_attributes:[:name, :sport_id, sport_attributes: [:name]] #:sport => [:name]]
      )
  end

  def find_user
    @player = Player.find(session[:user_id])
  end

end
