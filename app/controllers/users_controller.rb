class UsersController < ApplicationController
   
    #routes for login - renders login form
    get '/login' do 
      erb :'/users/login'  
    end

    # recieves the login form,  
    post '/login' do
      # finds the user,
      @user = User.find_by(username: params[:username])
      # authenticates the user
      if @user.authenticate(params[:password])
        # logs the user in a session - goes into application_controller for enabling sessions
        # redirects to index/show page
        binding.pry
      else
        # tell user they entered incorrect username/password
        # redirect them to login
      end
    end


    #routes for signup
    get '/signup' do
      erb :'/users/signup'
    end

end