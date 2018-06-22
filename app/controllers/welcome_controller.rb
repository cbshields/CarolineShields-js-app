class WelcomeController < ApplicationController

  def home

    if session[:user_id]
      #why wouldn't it work when it was @player = Player.find(session[:user_id])
      @player = Player.find_by(id: session[:user_id])
      if !@player
        session.delete("user_id")
        redirect_to signup_url, alert: "Account not found, please create new account" and return
      end
    end
     render :layout => "session"
  end

end
