class UsersController < ApplicationController
   
    #routes for login - renders login form
    get '/login' do 
      erb :'/login'  
    end

    #routes for signup
    get '/signup' do

    end

end