class PlayersController < ApplicationController
before_action :sign_in_user, only: [:index, :show, :edit, :update, :destroy]
before_action :find_user, only: [:edit, :update, :destroy]


  def index
    @players = Player.all
    @over_18 = Player.over_18
    @under_18 = Player.under_18
  end

  def new
    if !session[:tmpname]
      @player = Player.new
    else
      @player = Player.new(name: session[:tmpname], uid: session[:uid])
    end

    render :layout => "session"
  end

  def create
    @player = Player.create(player_params)
    binding.pry
    params[:player][:position_ids].each do |position_id|
      position = Position.find(position_id)
      @player.positions << position
    end

    #have to figure out how to add new positions

    @player.positions.each do |position|
      binding.pry
      if position.name.nil?
          binding.pry
        position.delete
      end
    end

    if @player.save
      session[:user_id] = @player.id
      redirect_to player_path(@player)
    else
      render :new
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    render :layout => "session"
  end

  def update
    @player.update(player_params)

    if @player.save
      redirect_to player_path(@player)
    else
      render :edit
    end

  def destroy
    session.delete("user_id")
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
      :uid,
      new_position:[:name],
      sport_ids:[],
      sports_attributes:[:name],
      positions_attributes:[:name]
      )
  end

  def find_user
    @player = Player.find(session[:user_id])
  end

end
