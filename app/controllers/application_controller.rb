require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "homework_login_app"
  end

  get "/" do
    erb :index
  end

  helpers do

    def logged_in
      # true if user is logged in, else false
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
