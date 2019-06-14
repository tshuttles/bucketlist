class UsersController < ApplicationController 
  
  # set up signup routes 
  
  
  get '/login' do 
    if logged_in?
      redirect "/items" 
    else 
      erb :'users/login'
    end
  end
  
  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/items"
    else
      redirect "/login"
    end
  end
  
end 