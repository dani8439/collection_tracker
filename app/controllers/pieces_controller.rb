class PiecesController < ApplicationController

  get '/pieces' do
    @pieces = Piece.all
    @user = User.find_by(params[:id])
    if logged_in?
      erb :'/pieces/pieces'
    else
      redirect :'/'
    end
  end


  get '/pieces/new' do
    if logged_in?
      erb :'pieces/new'
    else
      redirect :'/login'
    end
  end

  get '/pieces/:id' do
    if logged_in?
      @piece = Piece.find_by_id(params[:id])
      erb :'pieces/show_piece'
    else
      redirect :'/login'
    end
  end


  get '/pieces/:id/edit' do
    if logged_in?
      @piece = Piece.find_by_id(params[:id])
      erb :'/pieces/edit'
    else
      redirect :'/login'
    end
  end

  post '/pieces' do
    if params[:name] == "" || params[:size] == ""
      redirect :'/pieces/new'
    else
      @piece = Piece.create(name: params[:name], size: params[:size])
      if !params[:pattern][:name].empty?
        @piece.patterns << Pattern.create(name: params[:name], quantity: params[:quantity])
      end
      @piece.save
      flash[:message] = "Successfully created piece."
      redirect :"pieces/#{@piece.id}"
    end
  end


  patch '/pieces/:id' do
    @piece = Piece.find_by_id(params[:id])
    @piece.update(params[:piece])
    if !params[:pattern][:name].empty?
      @piece.patterns = Pattern.create(name: params[:name], quantity: params[:quantity])
    end
    @piece.save

    redirect :"pieces/#{@piece.id}"
  end

  delete '/pieces/:id/delete' do
    @piece = Piece.find_by_id(params[:id])
    if logged_in?
      if @piece && @piece.user_id == current_user
        @piece.delete
      end
      redirect :'/pieces'
    else
      redirect :'/login'
    end
  end

end
