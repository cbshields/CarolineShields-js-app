class WelcomeController < ApplicationController

  def home
    if session[:user_id]
      @player = Player.find(session[:user_id])
    end
  end

end
