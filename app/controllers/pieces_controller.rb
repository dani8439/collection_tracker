class PiecesController < ApplicationController

  get '/pieces' do
    @pieces = Piece.all
    erb :'pieces/pieces'
  end

  get '/pieces/new' do
    if logged_in?
      erb :'pieces/create_piece'
    else
      redirect :'/login'
    end
  end

  get '/pieces/:id' do
    if logged_in?
      @piece = Piece.find_by_id(params[:id])
      erb :'pieces/show_pieces'
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
    @piece = Piece.create(name: params[:name], size: params[:size], quantity: params[:quantity])
    if !params[:pattern][:name].empty?
      @piece.patterns << Pattern.create(name: params[:name], theme: params[:theme])
    end
    @piece.save

    redirect :"pieces/#{@piece.id}"
  end


  patch '/pieces/:id' do
    @piece = Piece.find_by_id(params[:id])
    @piece.update(params[:piece])
    if !params[:pattern][:name].empty?
      @piece.patterns = Pattern.create(name: params[:name], theme: params[:theme])
    end
    @piece.save

    redirect :"pieces/#{@piece.id}"
  end

  delete '/pieces/:id/delete' do
  end

end
