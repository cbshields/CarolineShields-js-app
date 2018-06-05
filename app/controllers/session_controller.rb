class SessionController < ApplicationController

  def new
  end

  def create
      @player = Player.find_by(name:params[:name])
      return head(:forbidden) unless @player && @player.authenticate(params[:password])
      if @player
        session[:user_id] = @player.id
        redirect_to player_path(@player)
      else
        render 'new'
      end
  end

  def facebook_session
    @player = Player.find_by(uid: auth['uid'])#_or_create_by(uid: auth['uid']) do |player|
      if !@player
      session[:tmpname] = auth['info']['name']
        redirect_to new_player_path
      else
         session[:user_id] = @player.id
         redirect_to root_path
      end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end
