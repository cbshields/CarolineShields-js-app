class PlayersController < ApplicationController
before_action :find_user, :sign_in_user, only: [:index, :show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def new
    binding.pry
    if @player.name.nil?
      @player = Player.new
    end
    
  end

  def create

    @player = Player.create(player_params)
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


  def find_user
    @player = Player.find(session[:user_id])
  end
end
