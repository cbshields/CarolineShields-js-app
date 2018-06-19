class SessionController < ApplicationController

  def new
  end

  def create
      @player = Player.find_by(params[:name])
      #how to make this not as crazy, use flash[:alert] instead

     return head(:forbidden) unless @player && @player.authenticate(params[:password])

        # flash[:alert] = "Your username or password is not correct, please try again"
        # redirect_to login_path
    


      if @player
        session[:user_id] = @player.id
        redirect_to player_path(@player)
      else
        render 'new'
      end
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
