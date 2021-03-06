require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "homework_login_app"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :index
    end
  end

  helpers do

    def logged_in?
      # true if user is logged in, else false
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized_to_edit?(homework_assignment)
      homework_assignment.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
      end
    end


    
  end

end
