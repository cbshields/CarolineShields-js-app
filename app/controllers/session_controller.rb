class SessionController < ApplicationController

  def new
  end

  def create
      @player = Player.find_by(name:params[:name])
      #return head(:forbidden) unless @player.authenticate(params[:password])
      session[:user_id] = @player.id
      redirect_to player_path(@player)
    else
      render 'new'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

end
