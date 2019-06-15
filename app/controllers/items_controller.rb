class ItemsController < ApplicationController 
  
  get '/items' do 
    if logged_in?
      @items = Item.all
      erb :'items/index'
    else
      redirect '/login'
    end
  end 
  
  get '/items/new' do
    if logged_in?
      erb :'items/new'
    else 
      redirect '/login'
    end
  end
  
  post 'items' do 
    if params[:content] == ""
      redirect '/items/new'
    else
      item = Item.create(:content => params[:content])
      item.user_id = session[:user_id]
      item.save
      redirect to "/items"
    end
  end 
  
  get '/items/:id' do 
  end 
  
  get '/items/:id/edit' do 
  end 
  
  patch '/items/:id' do 
  end 
  
  delete '/items/:id' do 
  end 
  
end 