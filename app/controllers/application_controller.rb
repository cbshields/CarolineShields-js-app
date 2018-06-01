require 'rack-flash'
class ApplicationController < ActionController::Base

use Rack::Flash



  private
    def sign_in_user
      unless logged_in?
        #flash[:message] = "Account not found, please create new account"
        redirect_to signup_url, alert: "Account not found, please create new account"
      end

    end
    def logged_in?
      !!current_user
    end

    def current_user
      Player.find_by(id:session[:user_id])
    end
end
