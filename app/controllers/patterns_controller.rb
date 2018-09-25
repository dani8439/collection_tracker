class PatternsController < ApplicationController
  get '/patterns' do
    @pattern = Pattern.all
    erb :'patterns/patterns'
  end


  get '/patterns/new' do
    if logged_in?
      erb :'patterns/create_pattern'
    else
      redirect :'/login'
    end
  end

  get '/patterns/:id' do
    @pattern = Pattern.find_by_id(params[:id])
    erb :'patterns/show_pattern'
  end

  post '/patterns' do
    @pattern = Pattern.create(name: params[:name], theme: params[:theme])
    @pattern.piece = Piece.find_or_create_by(name: params[:piece_name])
    @pattern.save

    redirect :"/patterns/#{@pattern.id}"

  end

  get '/patterns/:id/edit' do
  end

  patch '/patterns/:id' do
  end
end
