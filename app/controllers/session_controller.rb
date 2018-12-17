class SessionController < ApplicationController

  def new
  end

  def create
      @player = Player.find_by(name: params[:player][:name])
      #how to make this not as crazy, use flash[:alert] instead

    if !(@player && @player.authenticate(params[:password]))
      redirect_to login_url, alert: "Your username or password is not correct, please try again" and return
    end


        session[:user_id] = @player.id
        redirect_to player_path(@player)

  end

  def facebook_session
    @player = Player.find_by(uid: auth['uid'])
      if !@player
        session[:tmpname] = auth['info']['name']
        session[:uid] = auth['uid']
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
