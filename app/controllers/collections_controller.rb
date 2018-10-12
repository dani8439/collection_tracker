class CollectionsController < ApplicationController

  get '/collections' do
    @collection = Collection.all
    @user = User.find_by(params[:user_id])
    if logged_in?
      erb :'/collections/collections'
    else
      redirect :'/login'
    end
  end


  get '/collections/:id' do
    if logged_in?
      @collection = Collection.find_by_id(params[:id])
      erb :'/collections/show_collection'
    else
      redirect :'/login'
    end
  end

  post '/collections' do
    if logged_in?
      @collection = Collection.find_by_id(params[:id])
      @collection.patterns = Pattern.all
      @collection.pieces = Piece.all
      @collection.user_id = current_user.id
      @collection.save
      erb :'/collections/show_collection'
    else
      redirect :'/login'
    end

  end

end
