class PlayersController < ApplicationController
before_action :find_user, :sign_in_user, only: [:index, :show, :edit, :update, :destroy]
before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
    @over_18 = Player.over_18
    @under_18 = Player.under_18
  end

  def new
    if !session[:tmpname]
      @player = Player.new
    else
      @player = Player.new(name: session[:tmpname])
    end

  end

  def create

    @player = Player.create(player_params)
    @sport = Sport.create(sport_params)
    @position = Position.create(position_params)
    binding.pry
    if @player.save
      session[:user_id] = @player.id
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
      :password,
      :password_confirmation,
      :age,
      :address,
      #where to add these
      #sport_ids:[],
      sports_attributes: [:name, :id],
      # position_ids:[],
      positions_attributes: [:name, :id]
      )
  end

  def sport_params
      sports = params[:player][:sport_ids]
      sports.each do |sport|
          if sport != ""
            binding.pry
            params.require(:sport).permit(:name, sports_attributes:[:name])
          end
      end
  end

  def position_params
      params.require(:position).permit(:name, positions_attributes: [:name])
  end
  def find_user
    @player = Player.find(session[:user_id])
  end
end
