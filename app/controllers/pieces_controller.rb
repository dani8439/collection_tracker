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
    @piece = Piece.find_by_id(params[:id])
    erb :'pieces/show_piece'
  end

  post '/pieces' do
    @piece = Piece.create(name: params[:name], size: params[:size], pattern_name: params[:pattern_name])

    redirect :"pieces/#{@piece.id}"
  end

  post '/pieces/:id/edit' do
  end

  patch '/pieces/:id' do
  end

end
