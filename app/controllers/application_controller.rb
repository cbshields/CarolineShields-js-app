class ApplicationController < ActionController::Base

  private

    def logged_in?
      !!current_user
    end

    def current_user
      Player.find_by(id:session[player.id])
    end
end
