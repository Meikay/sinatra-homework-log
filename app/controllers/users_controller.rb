class UsersController < ApplicationController
   
    #routes for login - renders login form
    get '/login' do 
      erb :'/users/login'  
    end

    #routes for signup
    get '/signup' do
      erb :'/users/signup'
    end

end